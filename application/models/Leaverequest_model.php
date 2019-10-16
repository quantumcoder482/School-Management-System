<?php

/**
 * 
 */
class Leaverequest_model extends CI_model {

    public function staff_leave_request($id = null) {

        if ($id != null) {
            $this->db->where("staff_leave_request.staff_id", $id);
        }

        $query = $this->db->select('mainstaff.name, mainstaff.surname, mainstaff.employee_id, substaff.name as sub_name, substaff.surname as sub_surname, substaff.employee_id as sub_employee_id, staff_leave_request.*,leave_types.type')
            ->join("staff mainstaff", "mainstaff.id = staff_leave_request.staff_id")
            ->join("staff substaff", "substaff.id = staff_leave_request.substitute_staff_id", "left")
            ->join("leave_types", "leave_types.id = staff_leave_request.leave_type_id")
            ->where("mainstaff.is_active", "1")
            ->order_by("staff_leave_request.id", "desc")
            ->get("staff_leave_request");

        return $query->result_array();
    }

    public function user_leave_request($id = null) {


        $query = $this->db->select('mainstaff.name, mainstaff.surname, mainstaff.employee_id, substaff.name as sub_name, substaff.surname as sub_surname, substaff.employee_id as sub_employee_id, staff_leave_request.*, leave_types.type')
            ->join("staff mainstaff", "mainstaff.id = staff_leave_request.staff_id")
            ->join("staff substaff", "substaff.id = staff_leave_request.substitute_staff_id", "left")
            ->join("leave_types", "leave_types.id = staff_leave_request.leave_type_id")
            ->where("mainstaff.is_active", "1")
            ->where("mainstaff.id", $id)
            ->order_by("staff_leave_request.id", "desc")
            ->get("staff_leave_request");

        return $query->result_array();
    }

    public function allotedLeaveType($id) {

        $query = $this->db->select('staff_leave_details.*,leave_types.type,leave_types.id as typeid')->where(array('staff_id' => $id))->join("leave_types", "staff_leave_details.leave_type_id = leave_types.id")->group_by("leave_types.id")->get("staff_leave_details");

        return $query->result_array();
    }

    public function countLeavesData($staff_id, $leave_type_id) {

        $query1 = $this->db->select('sum(leave_days) as approve_leave')->where(array('staff_id' => $staff_id, 'status' => 'approve', 'leave_type_id' => $leave_type_id))->get("staff_leave_request");
        return $query1->row_array();
    }

    public function changeLeaveStatus($data, $staff_id) {


        $this->db->where("id", $staff_id)->update("staff_leave_request", $data);
    }

    public function getLeaveSummary() {

        $query = $this->db->select('*')->get("staff");

        return $query->result_array();
    }

    function addLeaveRequest($data) {

        if (isset($data['id'])) {

            $this->db->where("id", $data["id"]);
            $this->db->update("staff_leave_request", $data);
        } else {

            $this->db->insert("staff_leave_request", $data);
        }
    }

    function pendingStaffLeave(){

        $query = $this->db->select('*')->where('status', 'pending')->get("staff_leave_request");
        return $query->num_rows();

    }

}

?>