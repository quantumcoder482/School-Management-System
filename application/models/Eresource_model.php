<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Eresource_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    public function get($id = null)
    {
        $this->db->select('e_resources.*')->from('e_resources');
        if ($id != null) {
            $this->db->where('e_resources.id', $id);
        } else {
            $this->db->order_by('e_resources.id');
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
        $this->db->delete('e_resources');
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
            $this->db->update('e_resources', $data);
        } else {
            $this->db->insert('e_resources', $data);
            return $this->db->insert_id();
        }
    }
}
