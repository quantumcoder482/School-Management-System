<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Meeting_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->current_session = $this->setting_model->getCurrentSession();
    }

    public function get($id = null)
    {
        $this->db->select('meeting.*, committee.committee_name')->from('meeting');       
        $this->db->join('committee', 'meeting.committee_id = committee.id');
        if ($id != null) {
            $this->db->where('meeting.id', $id);
        } else {
            $this->db->order_by('meeting.id');
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
        $this->db->delete('meeting');
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
            $this->db->update('meeting', $data);
        } else {
            $this->db->insert('meeting', $data);
            return $this->db->insert_id();
        }
    }
}
