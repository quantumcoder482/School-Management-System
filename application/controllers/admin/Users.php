<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Users extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->model("classteacher_model");
    }

    function index()
    {
        if (!$this->rbac->hasPrivilege('user_status', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'users/index');
        $studentList = $this->student_model->getStudents();
        $staffList = $this->staff_model->getAll();
        $parentList = $this->parent_model->getParentList();

        $data['studentList'] = $studentList;
        $data['parentList'] = $parentList;
        $data['staffList'] = $staffList;

        $session_data = $this->session->userdata();
        $data['currentUserId'] = $session_data['admin']['id'];


        $this->load->view('layout/header', $data);
        $this->load->view('admin/users/userList', $data);
        $this->load->view('layout/footer', $data);
    }

    function changeStatus()
    {
        if (!$this->rbac->hasPrivilege('user_status', 'can_edit')) {
            access_denied();
        }
        $id = $this->input->post('id');
        $status = $this->input->post('status');
        $role = $this->input->post('role');
        $data = array('id' => $id, 'is_active' => $status);
        if ($role != "staff") {
            $result = $this->user_model->changeStatus($data);
        } else {
            if ($status == "yes") {
                $data['is_active'] = 1;
            } else {
                $data['is_active'] = 0;
            }
            // print_r($data);
            // exit();
            $result = $this->staff_model->update($data);
        }

        if ($result) {
            $response = array('status' => 1, 'msg' => 'Status change successfully');
            echo json_encode($response);
        }
    }


    function deletestudents()
    {
        if (!$this->rbac->hasPrivilege('user_status', 'can_delete')) {
            access_denied();
        }

        $ids_raw = $this->input->post('ids');

        if (!isset($ids_raw)) {
            $response = array('status' => 1, 'msg' => 'There are have not any selected items');
            echo json_encode($response);
        } else {
            $origin_rows = count($ids_raw);
            $ids = array();
            $error_ids = array();

            foreach ($ids_raw as $id_single) {
                $id = str_replace('student_', '', $id_single);

                try {
                    $r = $this->student_model->remove($id);
                    array_push($ids, $id);
                } catch (Exception $e) {
                    array_push($error_ids, $id);
                }
            }

            if ($origin_rows === count($ids)) {
                $result = array('status' => 1, 'msg' => 'Remove Students successfully');
                echo json_encode($result);
            } else {
                $result = array('status' => 0, 'msg' => 'Some Error occured');
                echo json_encode($result);
            }
        }
    }

    function deletestaffs()
    {
        if (!$this->rbac->hasPrivilege('user_status', 'can_delete')) {
            access_denied();
        }

        $ids_raw = $this->input->post('ids');

        if (!isset($ids_raw)) {
            $response = array('status' => 1, 'msg' => 'There are have not any selected items');
            echo json_encode($response);
        } else {
            $origin_rows = count($ids_raw);
            $ids = array();
            $error_ids = array();

            foreach ($ids_raw as $id_single) {
                $id = str_replace('staff_', '', $id_single);

                try {

                    $r = $this->staff_model->remove($id);
                    array_push($ids, $id);
                } catch (Exception $e) {
                    array_push($error_ids, $id);
                }
            }

            if ($origin_rows === count($ids)) {
                $result = array('status' => 1, 'msg' => 'Remove Staffs successfully');
                echo json_encode($result);
            } else {
                $result = array('status' => 0, 'msg' => 'Something Error occured');
                echo json_encode($result);
            }
        }
    }


    function admissionreport()
    {
        if (!$this->rbac->hasPrivilege('student_history', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Student Information');
        $this->session->set_userdata('sub_menu', 'admin/users/admissionreport');
        $data['title'] = 'Admission Report';
        $class = $this->class_model->get();
        $data['classlist'] = $class;
        $userdata = $this->customlib->getUserData();
        $carray = array();
        //   if(($userdata["role_id"] == 2) && ($userdata["class_teacher"] == "yes")){
        // $data["classlist"] =   $this->customlib->getClassbyteacher($userdata["id"]);
        if (!empty($data["classlist"])) {
            foreach ($data["classlist"] as $ckey => $cvalue) {

                $carray[] = $cvalue["id"];
            }
        }

        //  }

        $class_id = $this->input->post("class_id");
        $year = $this->input->post("year");

        $admission_year = $this->student_model->admissionYear();

        $data["admission_year"] = $admission_year;
        if ((empty($class_id)) && (empty($year))) {

            $this->form_validation->set_rules('class_id', 'Class', 'trim|required|xss_clean');

            if ($this->form_validation->run() == FALSE) {

                $resultlist = $this->student_model->studentAdmissionDetails($carray);
                $data["resultlist"] = $resultlist;
            }
        } else {


            $resultlist = $this->student_model->searchAdmissionDetails($class_id, $year);
            $data["resultlist"] = $resultlist;
        }
        if (!empty($resultlist)) {
            foreach ($resultlist as $key => $value) {

                $id = $value["sid"];
                $sessionlist[] = $this->student_model->studentSessionDetails($id);
            }
            $data["sessionlist"] = $sessionlist;
        }
        $this->load->view("layout/header", $data);
        $this->load->view("admin/users/admissionReport", $data);
        $this->load->view("layout/footer", $data);
    }

    function logindetailreport()
    {
        if (!$this->rbac->hasPrivilege('student_login_credential', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Student Information');
        $this->session->set_userdata('sub_menu', 'admin/users/logindetailreport');
        $class = $this->class_model->get();
        $data['classlist'] = $class;

        $studentdata = $this->student_model->get();
        if (isset($_POST["search"])) {

            $class_id = $this->input->post("class_id");
            $section_id = $this->input->post("section_id");

            $studentdata = $this->student_model->searchByClassSection($class_id, $section_id);
        }

        foreach ($studentdata as $key => $value) {
            $resultlist = $this->user_model->getUserLoginDetails($value["id"]);
            $parentlist = $this->user_model->getParentLoginDetails($value["id"]);
            if ($resultlist["role"] == "student") {
                $studentdata[$key]["student_username"] = $resultlist["username"];
                $studentdata[$key]["student_password"] = $resultlist["password"];
                $studentdata[$key]["parent_username"] = $parentlist["username"];
                $studentdata[$key]["parent_password"] = $parentlist["password"];
            }
        }


        $data["resultlist"] = $studentdata;

        $this->load->view("layout/header");
        $this->load->view("admin/users/logindetailreport", $data);
        $this->load->view("layout/footer");
    }
}
