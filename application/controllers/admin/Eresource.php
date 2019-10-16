<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Eresource extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('form');
    }

    function index() {
        if (!$this->rbac->hasPrivilege('e_resources', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Library');
        $this->session->set_userdata('sub_menu', 'eresource/index');
        $data['title'] = 'Add e-Resource';
        $data['title_list'] = 'e-Resource List';

        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('type', 'Type', 'trim|required|xss_clean');


        if ($this->form_validation->run() == FALSE) {

        } else {

            $data = array(
                'title' => $this->input->post('title'),
                'type' => $this->input->post('type'),
                'description' => $this->input->post('description'),
            );
            $insert_id = $this->Eresource_model->add($data);
            if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                $fileInfo = pathinfo($_FILES["attachment_file"]["name"]);
                $attachment = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["attachment_file"]["tmp_name"], "./uploads/e_resources/" . $attachment);
                $data = array('id' => $insert_id, 'attachment' => 'uploads/e_resources/' . $attachment);
                $this->Eresource_model->add($data);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">e-Resource added successfully</div>');
            redirect('admin/eresource');
        }
        $eresource_result = $this->Eresource_model->get();
        $data['eresource_list'] = $eresource_result;

        $this->load->view('layout/header', $data);
        $this->load->view('admin/eresource/eresourceList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function download($file) {
        $this->load->helper('download');
        $filepath = "./uploads/e_resources/" . $this->uri->segment(6);
        $data = file_get_contents($filepath);
        $name = $this->uri->segment(6);
        force_download($name, $data);
    }


    function delete($id) {
        if (!$this->rbac->hasPrivilege('e_resources', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'e-Resource List';
        $this->Eresource_model->remove($id);
        redirect('admin/eresource');
    }

    function handle_upload() {
        $error = "";
        if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
            $allowedExts = array('jpg', 'jpeg', 'png', 'doc', 'docx', 'pdf');
            $temp = explode(".", $_FILES["file"]["name"]);
            $extension = end($temp);
            if ($_FILES["file"]["error"] > 0) {
                $error .= "Error opening the file<br />";
            }
            if ($_FILES["file"]["type"] != 'image/gif' &&
                $_FILES["file"]["type"] != 'image/jpeg' &&
                $_FILES["file"]["type"] != 'image/png' &&
                $_FILES["file"]["type"] != 'application/msword' &&
                $_FILES["file"]["type"] != 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' &&
                $_FILES["file"]["type"] != 'application/pdf'
            ) {

                $this->form_validation->set_message('handle_upload', 'File type not allowed');
                return false;
            }
            if (!in_array($extension, $allowedExts)) {

                $this->form_validation->set_message('handle_upload', 'Extension not allowed');
                return false;
            }
            if ($_FILES["file"]["size"] > 10240000) {

                $this->form_validation->set_message('handle_upload', 'File size should be less than 100 kB');
                return false;
            }
            if ($error == "") {
                return true;
            }
        } else {
            return true;
        }
    }

    function edit($id) {
        if (!$this->rbac->hasPrivilege('e_resources', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Edit e-Resource';
        $data['id'] = $id;
        $e_resource = $this->Eresource_model->get($id);
        $data['e_resource'] = $e_resource;
        $eresource_result = $this->Eresource_model->get();
        $data['eresourcelist'] = $eresource_result;

        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('type', 'Type', 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/eresource/eresourceEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {

            $data = array(
                'id' => $id,
                'title' => $this->input->post('title'),
                'type' => $this->input->post('type'),
                'description' => $this->input->post('description'),
            );

            $this->Eresource_model->add($data);

            if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                $fileInfo = pathinfo($_FILES["attachment_file"]["name"]);
                $attachment = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["attachment_file"]["tmp_name"], "./uploads/e_resources/" . $attachment);
                $data_img = array('id' => $id, 'attachment' => 'uploads/e_resources/' . $attachment);

                $this->Eresource_model->add($data_img);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">e-Resource updated successfully</div>');
            redirect('admin/eresource');
        }
    }

}

?>