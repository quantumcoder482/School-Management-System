<?php

/**
 * 
 */
class Homework extends Student_Controller {

    function __construct() {
        parent::__construct();
        $this->load->library("customlib");
        $this->load->model("homework_model");
        $this->load->model("staff_model");
        $this->load->model("student_model");
    }

    public function index() {

        $this->session->set_userdata('top_menu', 'Homework');
        $data["created_by"] = "";
        $data["evaluated_by"] = "";
        $userdata = $this->customlib->getLoggedInUserData();
        $student_id = $userdata["student_id"];
        $result = $this->student_model->getRecentRecord($student_id);
        $class_id = $result["class_id"];
        $section_id = $result["section_id"];
        $homeworklist = $this->homework_model->getStudentHomework($class_id, $section_id);
        $data["homeworklist"] = $homeworklist;
        $data["class_id"] = $class_id;
        $data["section_id"] = $section_id;
        $data["subject_id"] = "";
        foreach ($homeworklist as $key => $value) {

            $report = $this->homework_model->getEvaluationReportForStudent($value["id"], $student_id);

           $data["homeworklist"][$key]["report"] = $report;

        }
//exit();
        $this->load->view("layout/student/header");
        $this->load->view("user/homework/homeworklist", $data);
        $this->load->view("layout/student/footer");
    }

    public function homework_detail($id) {

        $data["title"] = "Homework Evaluation";

        $userdata = $this->customlib->getLoggedInUserData();

        $student_id = $userdata["student_id"];
        $result = $this->homework_model->getRecord($id);
        $class_id = $result["class_id"];
        $section_id = $result["section_id"];
        $studentlist = $this->homework_model->getStudents($class_id, $section_id);
        $data["studentlist"] = $studentlist;
        $data["result"] = $result;
        $report = $this->homework_model->getEvaluationReportForStudent($id, $student_id);
        $data["report"] = $report;
        $data["created_by"] = "";
        $data["evaluated_by"] = "";
        if (!empty($report)) {
            $create_data = $this->staff_model->get($result["created_by"]);
            $eval_data = $this->staff_model->get($result["evaluated_by"]);
            $created_by = $create_data["name"];
            $evaluated_by = $eval_data["name"];
            $data["created_by"] = $created_by;
            $data["evaluated_by"] = $evaluated_by;
        }
        $this->load->view("user/homework/homework_detail", $data);
    }

    public function download($id, $doc) {
        $this->load->helper('download');
        $name = $this->uri->segment(5);
        $ext = explode(".", $name);
        $filepath = "./uploads/homework/" . $id . "." . $ext[1];
        $data = file_get_contents($filepath);
        force_download($name, $data);
    }

}

?>