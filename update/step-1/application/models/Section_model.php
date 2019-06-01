<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Section_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get($id = null) {
        $this->db->select()->from('sections');
        if ($id != null) {
            $this->db->where('id', $id);
        } else {
            $this->db->order_by('id');
        }
        $query = $this->db->get();
        if ($id != null) {
            return $query->row_array(); 
        } else {
            return $query->result_array(); 
        }
    }

    public function remove($id) {
        $this->db->where('id', $id);
        $this->db->delete('sections');
    }

    public function getClassBySection($classid) {
        $this->db->select('class_sections.id,class_sections.section_id,sections.section');
        $this->db->from('class_sections');
        $this->db->join('sections', 'sections.id = class_sections.section_id');
        $this->db->where('class_sections.class_id', $classid);
        $this->db->order_by('class_sections.id');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function getClassTeacherSection($classid) {

        $userdata = $this->customlib->getUserData();
        if (($userdata["role_id"] == 2)) {
            $id = $userdata["id"];
            $query = $this->db->select("class_teacher.section_id ,class_sections.id,sections.section")->join('sections', 'sections.id = class_teacher.section_id')->join('class_sections', 'sections.id = class_sections.section_id')->where(array('class_teacher.class_id' => $classid, 'class_teacher.staff_id' => $id))->group_by("class_teacher.section_id")->get("class_teacher");

            return $query->result_array();
        }
    }

    public function getSubjectTeacherSection($classid, $id) {

        $query = $this->db->select("class_sections.id,sections.section,class_sections.section_id")->join("class_sections", "teacher_subjects.class_section_id = class_sections.id")->join('sections', 'sections.id = class_sections.section_id')->where(array('class_sections.class_id' => $classid, 'teacher_subjects.teacher_id' => $id))->group_by("class_sections.section_id")->get("teacher_subjects");

        return $query->result_array();
    }

    public function getClassNameBySection($classid, $sectionid) {
        $this->db->select('class_sections.id,class_sections.section_id,sections.section,classes.class');
        $this->db->from('class_sections');
        $this->db->join('sections', 'sections.id = class_sections.section_id');
        $this->db->join('classes', 'classes.id = class_sections.class_id');
        $this->db->where('class_sections.class_id', $classid);
        $this->db->where('class_sections.section_id', $sectionid);
        $this->db->order_by('class_sections.id');
        $query = $this->db->get();
        return $query->result_array();
    }


    public function add($data) {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('sections', $data);
        } else {
            $this->db->insert('sections', $data);
        }
    }

}
