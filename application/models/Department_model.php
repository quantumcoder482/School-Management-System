<?php

/**
 * 
 */
class Department_model extends CI_model {

    public function valid_department($str) {
        $type = $this->input->post('type');
        $id = $this->input->post('departmenttypeid');
        if (!isset($id)) {
            $id = 0;
        }
        if ($this->check_department_exists($type, $id)) {
            $this->form_validation->set_message('check_exists', 'Record already exists');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    function check_department_exists($name, $id) {

        if ($id != 0) {
            $data = array('id != ' => $id, 'department_name' => $name);
            $query = $this->db->where($data)->get('department');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        } else {

            $this->db->where('department_name', $name);
            $query = $this->db->get('department');
            if ($query->num_rows() > 0) {
                return TRUE;
            } else {
                return FALSE;
            }
        }
    }

    function deleteDepartment($id) {

        $this->db->where("id", $id)->delete("department");
    }

    function getDepartmentType($id = null) {

        if (!empty($id)) {

            $query = $this->db->where("id", $id)->get('department');
            return $query->row_array();
        } else {

            $query = $this->db->get("department");
            return $query->result_array();
        }
    }

    public function addDepartmentType($data) {

        if (isset($data['id'])) {
            $this->db->where('id', $data['id']);
            $this->db->update('department', $data);
        } else {
            $this->db->insert('department', $data);
            return $this->db->insert_id();
        }
    }

}

?>