<?php

class Student_id_card_model extends CI_model {

    public function idcardlist() {
        $this->db->select('*');
        $this->db->from('id_card');
        $query = $this->db->get();
        return $query->result();
    }

    public function addidcard($data) {
        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('id_card', $data);

        } else {
            $this->db->insert('id_card', $data);

            return $this->db->insert_id();
        }
    }

    public function idcardbyid($id) {
        $this->db->select('*');
        $this->db->from('id_card');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function get($id) {
        $this->db->select('*');
        $this->db->from('id_card');
        $this->db->where('status = 1');
        $this->db->where('id', $id);
        $query = $this->db->get();
        return $query->result();
    }

    public function remove($id) {
        $this->db->where('id', $id);
        $this->db->delete('id_card');
    }

}

?>