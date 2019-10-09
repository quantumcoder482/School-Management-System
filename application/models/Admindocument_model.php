<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admindocument_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    public function get($id = null)
    {
        $this->db->select('admin_document.*, admin_categories.category_name')->from('admin_document');
        $this->db->join('admin_categories', 'admin_document.category_id = admin_categories.id');
        if ($id != null) {
            $this->db->where('admin_document.id', $id);
        } else {
            $this->db->order_by('admin_document.id');
        }

        $query = $this->db->get();
        if ($id != null) {
            return $query->row_array();
        } else {
            return $query->result_array();
        }
    }

    /**
     * This function will delete the record based on the id
     * @param $id
     */
    public function remove($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('admin_document');
    }

    /**
     * This function will take the post data passed from the controller
     * If id is present, then it will do an update
     * else an insert. One function doing both add and edit.
     * @param $data
     */
    public function add($data)
    {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('admin_document', $data);
        } else {
            $this->db->insert('admin_document', $data);
            return $this->db->insert_id();
        }
    }
}
