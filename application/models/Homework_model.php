<?php

/**
 * 
 */
class Homework_model extends CI_model {

    public function add($data) {

        if (isset($data["id"])) {

            $this->db->where("id", $data["id"])->update("homework", $data);
        } else {

            $this->db->insert("homework", $data);
            return $this->db->insert_id();
        }
    }

    public function get($id = null) {

        if (!empty($id)) {

            $query = $this->db->where("id", $id)->get("homework");
            return $query->row_array();
        } else {

            $query = $this->db->select("homework.*,homework_evaluation.date,classes.class,sections.section,subjects.name")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id", "left")->join("homework_evaluation", "homework.id = homework_evaluation.homework_id", "left")->group_by("homework.id")->get("homework");

            return $query->result_array();
        }
    }

    public function search_homework($class_id, $section_id, $subject_id) {

        if ((!empty($class_id)) && (!empty($section_id)) && (!empty($subject_id))) {

            $this->db->where(array('homework.class_id' => $class_id, 'homework.section_id' => $section_id, 'homework.subject_id' => $subject_id));
        } else if ((!empty($class_id)) && (empty($section_id)) && (empty($subject_id))) {

            $this->db->where(array('homework.class_id' => $class_id));
        } else if ((!empty($class_id)) && (!empty($section_id)) && (empty($subject_id))) {

            $this->db->where(array('homework.class_id' => $class_id, 'homework.section_id' => $section_id));
        }
        $query = $this->db->select("homework.*,classes.class,sections.section,subjects.name")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id", "left")->get("homework");

        return $query->result_array();
    }

    public function getRecord($id = null) {

        $query = $this->db->select("homework.*,classes.class,sections.section,subjects.name")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id", "left")->where("homework.id", $id)->get("homework");

        return $query->row_array();
    }

    public function getStudents($class_id, $section_id) {

        $query = $this->db->select("students.id,students.firstname,students.lastname,students.admission_no")->join("student_session", "students.id = student_session.student_id")->where(array('student_session.class_id' => $class_id, 'student_session.section_id' => $section_id, 'students.is_active' => "yes"))->group_by("student_session.student_id")->get("students");

        return $query->result_array();
    }

    public function delete($id) {

        $this->db->where("id", $id)->delete("homework");

        $this->db->where("homework_id", $id)->delete("homework_evaluation");
    }

    public function addEvaluation($data) {

        $this->db->insert("homework_evaluation", $data);
    }

    public function searchHomeworkEvaluation($class_id, $section_id, $subject_id) {

        if ((!empty($class_id)) && (!empty($section_id)) && (!empty($subject_id))) {

            $this->db->where(array('homework.class_id' => $class_id, 'homework.section_id' => $section_id, 'homework.subject_id' => $subject_id));
        } else if ((!empty($class_id)) && (empty($section_id)) && (empty($subject_id))) {

            $this->db->where(array('homework.class_id' => $class_id));
        } else if ((!empty($class_id)) && (!empty($section_id)) && (empty($subject_id))) {

            $this->db->where(array('homework.class_id' => $class_id, 'homework.section_id' => $section_id));
        }
        $query = $this->db->select("homework.*,classes.class,sections.section,subjects.name")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id", "left")->join("homework_evaluation", "homework.id = homework_evaluation.homework_id")->group_by("homework.id")->get("homework");

        return $query->result_array();
    }

    public function getEvaluationReport($id) {

        $query = $this->db->select("homework.*,homework_evaluation.student_id,homework_evaluation.id as evalid,homework_evaluation.date,homework_evaluation.status,classes.class,subjects.name,sections.section")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id")->join("homework_evaluation", "homework.id = homework_evaluation.homework_id")->where("homework.id", $id)->get("homework");

        return $query->result_array();
    }

    public function getEvaStudents($id, $class_id, $section_id) {

        $query = $this->db->select("students.*,homework_evaluation.student_id,homework_evaluation.date,homework_evaluation.status,classes.class,subjects.name,sections.section")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id")->join("homework_evaluation", "homework.id = homework_evaluation.homework_id")->join("students", "students.id = homework_evaluation.student_id", "left")->where("homework.id", $id)->get("homework");
        return $query->result_array();
    }

    public function delete_evaluation($prev_students) {

        if (!empty($prev_students)) {

            $this->db->where_in("id", $prev_students)->delete("homework_evaluation");
        }
    }

    public function count_students($class_id, $section_id) {

        $query = $this->db->select("*")->join("student_session", "students.id = student_session.student_id")->where(array('student_session.class_id' => $class_id, 'student_session.section_id' => $section_id, 'students.is_active' => "yes"))->group_by("student_session.student_id")->get("students");

        return $query->num_rows();
    }

    public function count_evalstudents($id, $class_id, $section_id) {

        $query = $this->db->select("students.*,homework_evaluation.student_id,homework_evaluation.date,homework_evaluation.status,classes.class,subjects.name,sections.section")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id")->join("homework_evaluation", "homework.id = homework_evaluation.homework_id")->join("students", "students.id = homework_evaluation.student_id", "left")->where("homework.id", $id)->get("homework");
        return $query->num_rows();
    }

    public function getStudentHomework($class_id, $section_id) {

        $query = $this->db->select("homework.*,subjects.name,sections.section,classes.class")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id")->where(array('homework.class_id' => $class_id, 'homework.section_id' => $section_id))->get("homework");
        return $query->result_array();
    }

    public function getEvaluationReportForStudent($id, $student_id) {

        $query = $this->db->select("homework.*,homework_evaluation.student_id,homework_evaluation.id as evalid,homework_evaluation.date,homework_evaluation.status,homework_evaluation.student_id,classes.class,subjects.name,sections.section")->join("classes", "classes.id = homework.class_id")->join("sections", "sections.id = homework.section_id")->join("subjects", "subjects.id = homework.subject_id")->join("homework_evaluation", "homework.id = homework_evaluation.homework_id")->where("homework.id", $id)->get("homework");
        //->where("homework_evaluation.student_id", $student_id)
        $result = $query->result_array();

        foreach ($result as $key => $value) {
            
            if($value["student_id"] == $student_id){

                return $value ;
            }else{

                $data  = array('date' => $value["date"],'status' => 'Incomplete' );
                return $data;
            }
        }

        //return $query->result_array();
    }

}

?>