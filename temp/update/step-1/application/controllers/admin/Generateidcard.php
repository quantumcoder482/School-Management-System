<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * 
 */
class Generateidcard extends Admin_Controller {

    function __construct() {
        parent::__construct();

        $this->load->library('Customlib');
    }

    public function index() {

        if (!$this->rbac->hasPrivilege('generate_id_card', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Certificate');
        $this->session->set_userdata('sub_menu', 'admin/generateidcard');
        //$this->data['certificateList'] = $this->Generatecertificate_model->certificateList();
        $idcardlist = $this->Generateidcard_model->getstudentidcard();
        $data['idcardlist'] = $idcardlist;
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/certificate/generateidcard', $data);
        $this->load->view('layout/footer', $data);
    }

    function search() {
        $this->session->set_userdata('top_menu', 'Certificate');
        $this->session->set_userdata('sub_menu', 'admin/generateidcard');
        //$data['title'] = 'Student Search';
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $idcardlist = $this->Generateidcard_model->getstudentidcard();
        $data['idcardlist'] = $idcardlist;
        $button = $this->input->post('search');
        if ($this->input->server('REQUEST_METHOD') == "GET") {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/certificate/Generateidcard', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $class = $this->input->post('class_id');
            $section = $this->input->post('section_id');
            $search = $this->input->post('search');
            $id_card = $this->input->post('id_card');
            if (isset($search)) {
                $this->form_validation->set_rules('class_id', 'Class', 'trim|required|xss_clean');

                $this->form_validation->set_rules('id_card', 'ID Card', 'trim|required|xss_clean');
                if ($this->form_validation->run() == FALSE) {
                    
                } else {
                    $data['searchby'] = "filter";
                    $data['class_id'] = $this->input->post('class_id');
                    $data['section_id'] = $this->input->post('section_id');
                    $id_card = $this->input->post('id_card');
                    $idcardResult = $this->Generateidcard_model->getidcardbyid($id_card);
                    $data['idcardResult'] = $idcardResult;
                    $resultlist = $this->student_model->searchByClassSection($class, $section);
                    $data['resultlist'] = $resultlist;
                    $title = $this->classsection_model->getDetailbyClassSection($data['class_id'], $data['section_id']);
                    $data['title'] = 'Student Details for ' . $title['class'] . "(" . $title['section'] . ")";
                }
            }
            $this->load->view('layout/header', $data);
            $this->load->view('admin/certificate/generateidcard', $data);
            $this->load->view('layout/footer', $data);
        }
    }

    public function generate($student, $class, $idcard) {
        //print_r($idcard); exit();
        $idcardlist = $this->Generateidcard_model->getidcardbyid($idcard);
        $data['idcardlist'] = $idcardlist;
        $resultlist = $this->student_model->searchByClassStudent($class, $student);
        $data['resultlist'] = $resultlist;
        //$this->load->view('layout/header', $data);
        $this->load->view('admin/certificate/studentidcard', $data);
        //$this->load->view('layout/footer', $data);
    }

    public function generatemultiple() {
        //echo "<pre>"; print_r($_POST); echo "</pre>"; exit();
        $studentid = $this->input->post('data');
        $student_array = json_decode($studentid);
        $idcard = $this->input->post('id_card');
        $class = $this->input->post('class_id');
        $data = array();
        $results = array();
        $std_arr = array();
        $data['sch_setting'] = $this->setting_model->get();
        $data['id_card'] = $this->Generateidcard_model->getidcardbyid($idcard);

        foreach ($student_array as $key => $value) {
            $std_arr[] = $value->student_id;
        }


        $data['students'] = $this->student_model->getStudentsByArray($std_arr);


        $id_cards = $this->load->view('admin/certificate/generatemultiple', $data, true);
        echo $id_cards;
        //$this->load->view('print/printFeesByGroupArray', $data);
    }

}

?>