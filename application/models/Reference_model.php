<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class reference_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
        $this->current_session_name = $this->setting_model->getCurrentSessionName();
        $this->start_month = $this->setting_model->getStartMonth();
    }

    function add($reference) {
        $this->db->insert('reference', $reference);
    }

    public function reference_list($id = null) {
        $this->db->select()->from('reference');
        if ($id != null) {
            $this->db->where('reference.id', $id);
        } else {
            $this->db->order_by('reference.id');
        }
        $query = $this->db->get();
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }

    public function delete($id) {
        $this->db->where('id', $id);
        $this->db->delete('reference');
    }

    public function update($id, $data) {
        $this->db->where('id', $id);
        $this->db->update('reference', $data);
    }

}
