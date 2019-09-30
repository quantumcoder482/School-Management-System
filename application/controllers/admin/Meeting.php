<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Meeting extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('form');
    }

    function index() {
        if (!$this->rbac->hasPrivilege('add_meeting', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Activities');
        $this->session->set_userdata('sub_menu', 'admin/meeting');
        $data['title'] = 'Add Meeting';
        $data['title_list'] = 'Meeting List';

        $this->form_validation->set_rules('meeting_name', 'Meeting Name', 'trim|required|xss_clean');
        $this->form_validation->set_rules('meeting_no', 'Meeting No.', 'trim|required|xss_clean');
        $this->form_validation->set_rules('committee_id', 'Committee', 'trim|required|xss_clean');


        if ($this->form_validation->run() == FALSE) {
            
        } else {

            $data = array(
                'meeting_name' => $this->input->post('meeting_name'),
                'meeting_no' => $this->input->post('meeting_no'),
                'committee_id' => $this->input->post('committee_id'),
                'date' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date'))),
                'description' => $this->input->post('description'),
            );
            $insert_id = $this->Meeting_model->add($data);
            if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                $fileInfo = pathinfo($_FILES["attachment_file"]["name"]);
                $attachment = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["attachment_file"]["tmp_name"], "./uploads/meeting_documents/" . $attachment);
                $data = array('id' => $insert_id, 'attachment' => 'uploads/meeting_documents/' . $attachment);
                $this->Meeting_model->add($data);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Meeting added successfully</div>');
            redirect('admin/meeting');
        }
        $meeting_result = $this->Meeting_model->get();
        $data['meetinglist'] = $meeting_result;
        $committee_list = $this->Committee_model->get();
        $data['committeelist'] = $committee_list;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/meeting/meetingList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function download($file) {
        $this->load->helper('download');
        $filepath = "./uploads/meeting_documents/" . $this->uri->segment(6);
        $data = file_get_contents($filepath);
        $name = $this->uri->segment(6);
        force_download($name, $data);
    }

    function getMeetingByCommittee() {
        $committee_id = $this->input->get('committee_id');
        $data = $this->Meeting_model->getMeetingByCommittee($committee_id);
        echo json_encode($data);
    }

    function delete($id) {
        if (!$this->rbac->hasPrivilege('add_meeting', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Meeting List';
        $this->Meeting_model->remove($id);
        redirect('admin/meeting');
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
        if (!$this->rbac->hasPrivilege('add_meeting', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Edit Meeting';
        $data['id'] = $id;
        $meeting = $this->Meeting_model->get($id);
        $data['meeting'] = $meeting;
        $meeting_result = $this->Meeting_model->get();
        $data['meetinglist'] = $meeting_result;
        $committee_list = $this->Committee_model->get();
        $data['committeelist'] = $committee_list;


        $this->form_validation->set_rules('meeting_name', 'Meeting Name', 'trim|required|xss_clean');
        $this->form_validation->set_rules('meeting_no', 'Meeting No.', 'trim|required|xss_clean');
        $this->form_validation->set_rules('committee_id', 'Committee', 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/meeting/meetingEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {

            $data = array(
                'id' => $id,
                'meeting_name' => $this->input->post('meeting_name'),
                'meeting_no' => $this->input->post('meeting_no'),
                'committee_id' => $this->input->post('committee_id'),
                'date' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date'))),
                'description' => $this->input->post('description'),
            );

            $this->Meeting_model->add($data);


            if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                $fileInfo = pathinfo($_FILES["attachment_file"]["name"]);
                $attachment = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["attachment_file"]["tmp_name"], "./uploads/meeting_documents/" . $attachment);
                $data_img = array('id' => $id, 'attachment' => 'uploads/meeting_documents/' . $attachment);

                $this->Meeting_model->add($data_img);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Meeting updated successfully</div>');
            redirect('admin/meeting');
        }
    }

}

?>