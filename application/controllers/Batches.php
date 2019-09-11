<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Batches extends Admin_Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {
        if (!$this->rbac->hasPrivilege('batch', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Academics');
        $this->session->set_userdata('sub_menu', 'batches/index');
        $data['title'] = 'Batch List';

        $batch_result = $this->batch_model->get();
        $data['batchlist'] = $batch_result;
        $this->form_validation->set_rules('batch', 'Batch', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('batch/batchList', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'batch' => $this->input->post('batch'),
            );
            $this->batch_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Batch added successfully</div>');
            redirect('batches/index');
        }
    }

    function view($id) {
        if (!$this->rbac->hasPrivilege('batch', 'can_view')) {
            access_denied();
        }
        $data['title'] = 'Batch List';
        $batch = $this->batch_model->get($id);
        $data['batch'] = $batch;
        $this->load->view('layout/header', $data);
        $this->load->view('batch/batchShow', $data);
        $this->load->view('layout/footer', $data);
    }

    function delete($id) {
        if (!$this->rbac->hasPrivilege('batch', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Batch List';
        $this->batch_model->remove($id);
        redirect('batches/index');
    }

    function getAll(){
        $data = $this->batch_model->get();
        echo json_encode($data);
    }

    function getByClass() {
        $class_id = $this->input->get('class_id');
        $data = $this->batch_model->getClassByBatch($class_id);
        echo json_encode($data);
    }

    function getClassTeacherBatch() {
        $class_id = $this->input->get('class_id');
        $data = array();
        $userdata = $this->customlib->getUserData();
        if (($userdata["role_id"] == 2) && ($userdata["class_teacher"] == "yes")) {
            $id = $userdata["id"];
            $query = $this->db->where("staff_id", $id)->where("class_id", $class_id)->get("class_teacher");

            if ($query->num_rows() > 0) {


                $data = $this->batch_model->getClassTeacherBatch($class_id);
            } else {

                $data = $this->batch_model->getSubjectTeacherBatch($class_id, $id);
            }
        } else {
            $data = $this->batch_model->getClassByBatch($class_id);
        }
        echo json_encode($data);
    }

    function edit($id) {
        if (!$this->rbac->hasPrivilege('batch', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Batch List';
        $batch_result = $this->batch_model->get();
        $data['batchlist'] = $batch_result;
        $data['title'] = 'Edit Batch';
        $data['id'] = $id;
        $batch = $this->batch_model->get($id);
        $data['batch'] = $batch;
        $this->form_validation->set_rules('batch', 'Batch', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('batch/batchEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'id' => $id,
                'batch' => $this->input->post('batch'),
            );
            $this->batch_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Batch updated successfully</div>');
            redirect('batches/index');
        }
    }

}

?>