<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Committee extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('url');
    }

    function index() {
        if (!$this->rbac->hasPrivilege('add_committee', 'can_view')) {
            access_denied();
        }
        
        $this->session->set_userdata('top_menu', 'Activities');
        $this->session->set_userdata('sub_menu', 'admin/committee');
        $data['title'] = 'Committee List';
        $committee_result = $this->Committee_model->get();
        $data['committeelist'] = $committee_result;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/committee/committeeList', $data);
        $this->load->view('layout/footer', $data);
    }

    function delete($id) {
        if (!$this->rbac->hasPrivilege('add_committee', 'can_delete')) {
            access_denied();
        }
        $this->Committee_model->remove($id);
        redirect('admin/committee');
    }

    function create() {
        if (!$this->rbac->hasPrivilege('add_committee', 'can_add')) {
            access_denied();
        }
        $data['title'] = 'Add Committee';
        $committee_result = $this->Committee_model->get();
        $data['committeelist'] = $committee_result;
        $this->form_validation->set_rules('committee_name', 'Committee Name', 'trim|required|xss_clean');
        $this->form_validation->set_rules('in_charge', 'Committee In-charge', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/committee/committeeList', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'committee_name' => $this->input->post('committee_name'),
                'in_charge' => $this->input->post('in_charge'),
                'description' => $this->input->post('description'),
            );
            $this->Committee_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Committee added successfully</div>');
            redirect('admin/committee');
        }
    }

    function edit($id) {
        if (!$this->rbac->hasPrivilege('add_committee', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Edit Committee';
        $committee_result = $this->Committee_model->get();
        $data['committeelist'] = $committee_result;
        $data['id'] = $id;
        $committee = $this->Committee_model->get($id);
        $data['committee'] = $committee;
        $this->form_validation->set_rules('committee_name', 'Committee Name', 'trim|required|xss_clean');
        $this->form_validation->set_rules('in_charge', 'Committee In-charge', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/committee/committeeEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'id' => $id,
                'committee_name' => $this->input->post('committee_name'),
                'in_charge' => $this->input->post('in_charge'),
                'description' => $this->input->post('description'),
            );
            $this->Committee_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Committee updated successfully</div>');
            redirect('admin/committee');
        }
    }

}

?>