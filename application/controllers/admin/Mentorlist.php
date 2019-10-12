<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Mentorlist extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->helper('form');
    }

    function index()
    {
        if (!$this->rbac->hasPrivilege('mentor_list', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Administration');
        $this->session->set_userdata('sub_menu', 'admin/mentorlist');
        $data['title'] = 'Mentor List';

        $mentorlist = $this->staff_model->get();
        $data['mentorlist'] = $mentorlist;

        $studentlist = array();

        $this->form_validation->set_rules('mentor', 'Select Mentor', 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {

        } else {

            $mentor_id = $this->input->post('mentor');

            if(isset($mentor_id)){
                $studentlist = $this->student_model->getStudentbyMentor($mentor_id);
            }

        }

        $data['studentlist'] = $studentlist;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/mentorlist/index', $data);
        $this->load->view('layout/footer', $data);
    }
}

?>