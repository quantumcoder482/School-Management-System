<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Batch_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get($id = null) {
        $this->db->select()->from('batches');
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
        $this->db->delete('batches');
    }

    public function getClassBySection($classid) {
        $this->db->select('class_batches.id,class_batches.batch_id,batches.batch');
        $this->db->from('class_batches');
        $this->db->join('batches', 'batches.id = class_batches.batch_id');
        $this->db->where('class_batches.class_id', $classid);
        $this->db->order_by('class_batches.id');
        $query = $this->db->get();
        return $query->result_array();
    }

    public function getClassTeacherSection($classid) {

        $userdata = $this->customlib->getUserData();
        if (($userdata["role_id"] == 2)) {
            $id = $userdata["id"];
            $query = $this->db->select("class_teacher.batch_id ,class_batches.id,batches.batch")->join('batches', 'batches.id = class_teacher.batch_id')->join('class_batches', 'batches.id = class_batches.batch_id')->where(array('class_teacher.class_id' => $classid, 'class_teacher.staff_id' => $id))->group_by("class_teacher.batch_id")->get("class_teacher");

            return $query->result_array();
        }
    }

    public function getSubjectTeacherSection($classid, $id) {

        $query = $this->db->select("class_batches.id,batches.batch,class_batches.batch_id")->join("class_batches", "teacher_subjects.class_batch_id = class_batches.id")->join('batches', 'batches.id = class_batches.batch_id')->where(array('class_batches.class_id' => $classid, 'teacher_subjects.teacher_id' => $id))->group_by("class_batches.batch_id")->get("teacher_subjects");

        return $query->result_array();
    }

    public function getClassNameBySection($classid, $batchid) {
        $this->db->select('class_batches.id,class_batches.batch_id,batches.batch,classes.class');
        $this->db->from('class_batches');
        $this->db->join('batches', 'batches.id = class_batches.batch_id');
        $this->db->join('classes', 'classes.id = class_batches.class_id');
        $this->db->where('class_batches.class_id', $classid);
        $this->db->where('class_batches.batch_id', $batchid);
        $this->db->order_by('class_batches.id');
        $query = $this->db->get();
        return $query->result_array();
    }


    public function add($data) {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('batches', $data);
        } else {
            $this->db->insert('batches', $data);
        }
    }

}
