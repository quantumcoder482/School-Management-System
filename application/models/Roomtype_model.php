<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class roomtype_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    public function get($id = null) {
        $this->db->select();
        $this->db->from('room_types');
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
        $this->db->delete('room_types');
    }

    public function add($data) {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('room_types', $data);
        } else {
            $this->db->insert('room_types', $data);
            return $this->db->insert_id();
        }
    }

    public function lists() {
        $this->db->select()->from('room_types');
        $listroomtype = $this->db->get();
        return $listroomtype->result_array();
    }

}
