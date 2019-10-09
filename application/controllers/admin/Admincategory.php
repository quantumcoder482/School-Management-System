<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admincategory extends Admin_Controller {

    function __construct() {
        parent::__construct();
        $this->load->helper('url');
    }

    function index() {
        if (!$this->rbac->hasPrivilege('add_admincategory', 'can_view')) {
            access_denied();
        }
        
        $this->session->set_userdata('top_menu', 'Administration');
        $this->session->set_userdata('sub_menu', 'admin/admincategory');
        $data['title'] = 'Category List';
        $admincategory_result = $this->Admincategory_model->get();
        $data['categorylist'] = $admincategory_result;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/admincategory/admincategoryList', $data);
        $this->load->view('layout/footer', $data);
    }

    function delete($id) {
        if (!$this->rbac->hasPrivilege('add_admincategory', 'can_delete')) {
            access_denied();
        }
        $this->Admincategory_model->remove($id);
        redirect('admin/admincategory');
    }

    function create() {
        if (!$this->rbac->hasPrivilege('add_admincategory', 'can_add')) {
            access_denied();
        }
        $data['title'] = 'Add Category';
        $admincategory_result = $this->Admincategory_model->get();
        $data['categorylist'] = $admincategory_result;
        $this->form_validation->set_rules('category_name', 'Category Name', 'trim|required|xss_clean');
        $this->form_validation->set_rules('in_charge', 'Category In-charge', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/admincategory/admincategoryList', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'category_name' => $this->input->post('category_name'),
                'in_charge' => $this->input->post('in_charge'),
                'description' => $this->input->post('description'),
            );
            $this->Admincategory_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Category added successfully</div>');
            redirect('admin/admincategory');
        }
    }

    function edit($id) {
        if (!$this->rbac->hasPrivilege('add_admincategory', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Edit Category';
        $admincategory_result = $this->Admincategory_model->get();
        $data['categorylist'] = $admincategory_result;
        $data['id'] = $id;
        $admincategory = $this->Admincategory_model->get($id);
        $data['category'] = $admincategory;
        $this->form_validation->set_rules('category_name', 'Category Name', 'trim|required|xss_clean');
        $this->form_validation->set_rules('in_charge', 'Category In-charge', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/admincategory/admincategoryEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'id' => $id,
                'category_name' => $this->input->post('category_name'),
                'in_charge' => $this->input->post('in_charge'),
                'description' => $this->input->post('description'),
            );
            $this->Admincategory_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Category updated successfully</div>');
            redirect('admin/admincategory');
        }
    }

}

?>