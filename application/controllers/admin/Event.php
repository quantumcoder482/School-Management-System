<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Event extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('form');
    }

    function index() {
        if (!$this->rbac->hasPrivilege('add_event', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Activities');
        $this->session->set_userdata('sub_menu', 'admin/event');
        $data['title'] = 'Add Event';
        $data['title_list'] = 'Recent Events';

        $this->form_validation->set_rules('event_name', 'Event Name', 'trim|required|xss_clean');
        $this->form_validation->set_rules('in_charge', 'Event In-charge', 'trim|required|xss_clean');
        $this->form_validation->set_rules('committee_id', 'Select Committee', 'trim|required|xss_clean');


        if ($this->form_validation->run() == FALSE) {
            
        } else {
            $event_date = $this->input->post('event_date');
            if (!empty($event_date)){
                $exp = explode("-", $event_date);
                $date_from = date("Y-m-d", strtotime($exp[0]));
                $date_to = date("Y-m-d", strtotime($exp[1]));
            } else {
                $date_from = "";
                $date_to = "";
            }

            $data = array(
                'event_name' => $this->input->post('event_name'),
                'in_charge' => $this->input->post('in_charge'),
                'committee_id' => $this->input->post('committee_id'),
                'date_from' => date('Y-m-d', $this->customlib->datetostrtotime($date_from)),
                'date_to' => date('Y-m-d', $this->customlib->datetostrtotime($date_to)),
                'description' => $this->input->post('description'),
            );
            $insert_id = $this->Event_model->add($data);
            if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                $fileInfo = pathinfo($_FILES["attachment_file"]["name"]);
                $attachment_filename = $insert_id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["attachment_file"]["tmp_name"], "./uploads/event_documents/" . $attachment_filename);
                $data_img = array('id' => $insert_id, 'attachment' => 'uploads/event_documents/' . $attachment_filename);
                $this->Event_model->add($data_img);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Event added successfully</div>');
            redirect('admin/event');
        }
        $event_result = $this->Event_model->get();
        $data['eventlist'] = $event_result;
        $committee_list = $this->Committee_model->get();
        $data['committeelist'] = $committee_list;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/event/eventList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function download($file) {
        $this->load->helper('download');
        $filepath = "./uploads/event_documents/" . $this->uri->segment(6);
        $data = file_get_contents($filepath);
        $name = $this->uri->segment(6);
        force_download($name, $data);
    }

    function getEventByCommittee() {
        $committee_id = $this->input->get('committee_id');
        $data = $this->Event_model->getEventByCommittee($committee_id);
        echo json_encode($data);
    }

    function delete($id) {
        if (!$this->rbac->hasPrivilege('add_event', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Event List';
        $this->Event_model->remove($id);
        redirect('admin/event');
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
        if (!$this->rbac->hasPrivilege('add_event', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Edit Event';
        $data['id'] = $id;
        $event = $this->Event_model->get($id);
        $data['event'] = $event;
        $data['title_list'] = 'Event List';
        $event_result = $this->Event_model->get();
        $data['eventlist'] = $event_result;
        $committee_list = $this->Committee_model->get();
        $data['committeelist'] = $committee_list;

        $this->form_validation->set_rules('event_name', 'Event Name', 'trim|required|xss_clean');
        $this->form_validation->set_rules('in_charge', 'Event In-charge', 'trim|required|xss_clean');
        $this->form_validation->set_rules('committee_id', 'Committee', 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/event/eventEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $committee_id = ($this->input->post('committee_id')) ? $this->input->post('committee_id') : NULL;
            $event_date = $this->input->post('event_date');
            if (!empty($event_date)){
                $exp = explode("-", $event_date);
                $date_from = date("Y-m-d", strtotime($exp[0]));
                $date_to = date("Y-m-d", strtotime($exp[1]));
            } else {
                $date_from = "";
                $date_to = "";
            }

            $data = array(
                'id' => $id,
                'event_name' => $this->input->post('event_name'),
                'in_charge' => $this->input->post('in_charge'),
                'committee_id' => $this->input->post('committee_id'),
                'date_from' => date('Y-m-d', $this->customlib->datetostrtotime($date_from)),
                'date_to' => date('Y-m-d', $this->customlib->datetostrtotime($date_to)),
                'description' => $this->input->post('description'),
            );

            $this->Event_model->add($data);


            if (isset($_FILES["attachment_file"]) && !empty($_FILES['attachment_file']['name'])) {
                $fileInfo = pathinfo($_FILES["attachment_file"]["name"]);
                $attachment_filename = $id . '.' . $fileInfo['extension'];
                move_uploaded_file($_FILES["attachment_file"]["tmp_name"], "./uploads/event_documents/" . $attachment_filename);
                $data_img = array('id' => $id, 'attachment' => 'uploads/event_documents/' . $attachment_filename);

                $this->Event_model->add($data_img);
            }

            // $this->event_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Event updated successfully</div>');
            redirect('admin/event');
        }
    }

}

?>