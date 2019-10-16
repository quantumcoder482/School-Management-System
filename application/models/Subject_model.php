<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Subject_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    public function get($id = null) {
        $this->db->select()->from('subjects');
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
        $this->db->delete('subjects');
    }

    public function add($data) {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('subjects', $data);
        } else {
            $this->db->insert('subjects', $data);
            return $this->db->insert_id();
        }
    }

    function check_data_exists($data) {
        $this->db->where('name', $data['name']);
        $query = $this->db->get('subjects');
        if ($query->num_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    function check_code_exists($data) {
        $this->db->where('code', $data['code']);
        $query = $this->db->get('subjects');
        if ($query->num_rows() > 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function getByStudentId($student_id){

        $sql = "SELECT subjects.* FROM subjects INNER JOIN teacher_subjects ON teacher_subjects.subject_id=subjects.id INNER JOIN class_sections ON class_sections.id=teacher_subjects.class_section_id INNER JOIN student_session ON student_session.class_id=class_sections.class_id AND student_session.section_id=class_sections.section_id WHERE teacher_subjects.session_id=".$this->db->escape($this->current_session)." AND student_session.student_id=".$this->db->escape($student_id);
        $query = $this->db->query($sql);
        return $query->result_array();

    }

}
