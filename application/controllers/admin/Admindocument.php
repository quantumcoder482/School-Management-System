<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admindocument extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('form');
    }

    function index() {
        if (!$this->rbac->hasPrivilege('admin_document', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Administration');
        $this->session->set_userdata('sub_menu', 'admin/admindocument');
        $data['title'] = 'Add Document';
        $data['title_list'] = 'Document List';

        $this->form_validation->set_rules('document_title', 'Document Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('document_no', 'Document No.', 'trim|required|xss_clean');
        $this->form_validation->set_rules('category_id', 'Category', 'trim|required|xss_clean');


        if ($this->form_validation->run() == FALSE) {

        } else {

            $data = array(
                'document_title' => $this->input->post('document_title'),
                'document_no' => $this->input->post('document_no'),
                'category_id' => $this->input->post('category_id'),
                'description' => $this->input->post('description'),
            );
            $insert_id = $this->Admindocument_model->add($data);
            if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                $fileInfo = pathinfo($_FILES["attachment_file"]["name"]);
                $attachment = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["attachment_file"]["tmp_name"], "./uploads/admin_documents/" . $attachment);
                $data = array('id' => $insert_id, 'attachment' => 'uploads/admin_documents/' . $attachment);
                $this->Admindocument_model->add($data);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Meeting added successfully</div>');
            redirect('admin/admindocument');
        }
        $document_result = $this->Admindocument_model->get();
        $data['documentlist'] = $document_result;
        $category_list = $this->Admincategory_model->get();
        $data['categorylist'] = $category_list;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/admindocument/documentList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function download($file) {
        $this->load->helper('download');
        $filepath = "./uploads/admin_documents/" . $this->uri->segment(6);
        $data = file_get_contents($filepath);
        $name = $this->uri->segment(6);
        force_download($name, $data);
    }


    function delete($id) {
        if (!$this->rbac->hasPrivilege('admin_document', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Document List';
        $this->Admindocument_model->remove($id);
        redirect('admin/admindocument');
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
        if (!$this->rbac->hasPrivilege('admin_document', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Edit Document';
        $data['id'] = $id;
        $document = $this->Admindocument_model->get($id);
        $data['document'] = $document;
        $document_result = $this->Admindocument_model->get();
        $data['documentlist'] = $document_result;
        $category_list = $this->Admincategory_model->get();
        $data['categorylist'] = $category_list;


        $this->form_validation->set_rules('document_title', 'Document Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('document_no', 'Document No.', 'trim|required|xss_clean');
        $this->form_validation->set_rules('category_id', 'Category', 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/admindocument/documentEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {

            $data = array(
                'id' => $id,
                'document_title' => $this->input->post('document_title'),
                'document_no' => $this->input->post('document_no'),
                'category_id' => $this->input->post('category_id'),
                'description' => $this->input->post('description'),
            );

            $this->Admindocument_model->add($data);


            if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                $fileInfo = pathinfo($_FILES["attachment_file"]["name"]);
                $attachment = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["attachment_file"]["tmp_name"], "./uploads/admin_documents/" . $attachment);
                $data_img = array('id' => $id, 'attachment' => 'uploads/admin_documents/' . $attachment);

                $this->Admindocument_model->add($data_img);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Document updated successfully</div>');
            redirect('admin/admindocument');
        }
    }

}

?>