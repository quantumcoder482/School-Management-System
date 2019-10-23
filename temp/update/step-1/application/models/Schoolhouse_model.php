<?php
class Schoolhouse_model extends CI_model {

    public function get($id = null) {

        if (!empty($id)) {

            $query = $this->db->where("id", $id)->get("school_houses");

            return $query->row_array();
        } else {

            $query = $this->db->get("school_houses");
            return $query->result_array();
        }
    }

    public function add($data) {

        if (isset($data["id"])) {

            $this->db->where("id", $data["id"])->update("school_houses", $data);
        } else {
            $this->db->insert("school_houses", $data);
        }
    }

    public function delete($id) {

        $this->db->where("id", $id)->delete("school_houses");
    }

}

?>