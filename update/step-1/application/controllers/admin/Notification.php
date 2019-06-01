<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Notification extends Admin_Controller
{

    public function __construct()
    {
        parent::__construct();
           $this->load->library('mailsmsconf');      
    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('notice_board', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Communicate');
        $this->session->set_userdata('sub_menu', 'notification/index');
        $data['title'] = 'Notifications';

        $notifications = $this->notification_model->get();

        $user_role = json_decode($this->customlib->getStaffRole());

        //$data['notificationlist'] = $notifications;

        $userdata        = $this->customlib->getUserData();
        $role_id         = $userdata["role_id"];
        $user_id         = $userdata["id"];
        $data["user_id"] = $user_id;

        if (!empty($notifications)) {
            foreach ($notifications as $key => $value) {
                $created_by_name = $this->notification_model->getcreatedByName($value["created_id"]);
                $roles           = $value["roles"];

                $arr = explode(",", $roles);
                if ($user_role->name == "Super Admin") {
                    $rname = $this->notification_model->getRole($arr);

                    $data['notificationlist'][$key]              = $notifications[$key];
                    $data['notificationlist'][$key]["role_name"] = $rname;
                } elseif ((in_array($role_id, $arr)) || ($value["created_id"] == $user_id)) {
                    //  echo "yes";
                    $rname = $this->notification_model->getRole($arr);

                    $data['notificationlist'][$key]              = $notifications[$key];
                    $data['notificationlist'][$key]["role_name"] = $rname;

                }
                $data['notificationlist'][$key]["createdby_name"] = $created_by_name["name"] . " " . $created_by_name["surname"];
            }
        }

        $this->load->view('layout/header', $data);
        $this->load->view('admin/notification/notificationList', $data);
        $this->load->view('layout/footer', $data);
    }

    public function add()
    {

 
        if (!$this->rbac->hasPrivilege('notice_board', 'can_add')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Communicate');
        $this->session->set_userdata('sub_menu', 'notification/add');
        $data['title']      = 'Add Notification';
        $data['title_list'] = 'Notification List';
        $data['roles']      = $this->role_model->get();

        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('message', 'Message', 'trim|required|xss_clean');
        $this->form_validation->set_rules('date', 'Notice Date', 'trim|required|xss_clean');
        $this->form_validation->set_rules('publish_date', 'Publish Date', 'trim|required|xss_clean');
        $this->form_validation->set_rules('visible[]', 'Message To', 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {

        } else {

            $userdata    = $this->customlib->getUserData();
            $student     = "No";
            $staff       = "No";
            $parent      = "No";
            $staff_roles = array();
            $visible     = $this->input->post('visible');
            foreach ($visible as $key => $value) {
                if ($value == "student") {
                    $student = "Yes";
                } else if ($value == "parent") {
                    $parent = "Yes";
                } else if (is_numeric($value)) {

                    $staff_roles[] = array('role_id' => $value, 'send_notification_id' => '');
                    $staff         = "Yes";
                }
            }

            $data = array(
                'message'         => $this->input->post('message'),
                'title'           => $this->input->post('title'),
                'date'            => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date'))),
                'created_by'      => $userdata["user_type"],
                'created_id'      => $this->customlib->getStaffID(),
                'visible_student' => $student,
                'visible_staff'   => $staff,
                'visible_parent'  => $parent,
                'publish_date'    => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('publish_date'))),
            );
            $notifiction_student = array();
         
            if ($student == 'Yes') {
                $msg=array();
                 $msg['body']=$this->input->post('message');
                 $msg['title']= $this->input->post('title');
             $this->mailsmsconf->mailsms('notification',array('students','msg'=>$msg));

            }
   
            $this->notification_model->insertBatch($data, $staff_roles);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Notification added successfully!</div>');
            redirect('admin/notification/index');
        }
        $exam_result      = $this->exam_model->get();
        $data['examlist'] = $exam_result;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/notification/notificationAdd', $data);
        $this->load->view('layout/footer', $data);
    }

    public function edit($id)
    {

        $userdata = $this->customlib->getUserData();

        $user_id = $userdata["id"];

        $usernotification = $this->notification_model->get($id);

        if ((!$this->rbac->hasPrivilege('notice_board', 'can_edit'))) {
            if ($usernotification['created_id'] != $user_id) {

                access_denied();

            }
        }
        $data['id']   = $id;
        $notification = $this->notification_model->get($id);

        $data['notification'] = $notification;
        $data['roles']        = $this->role_model->get();
        $data['title']        = 'Edit Notification';
        $data['title_list']   = 'Notification List';
        $this->form_validation->set_rules('title', 'Title', 'trim|required|xss_clean');
        $this->form_validation->set_rules('message', 'Message', 'trim|required|xss_clean');
        $this->form_validation->set_rules('date', 'Notice Date', 'trim|required|xss_clean');
        $this->form_validation->set_rules('publish_date', 'Publish Date', 'trim|required|xss_clean');
        if ($this->form_validation->run() == false) {

        } else {

            $userdata    = $this->customlib->getUserData();
            $student     = "No";
            $staff       = "No";
            $parent      = "No";
            $prev_roles  = $this->input->post('prev_roles');
            $visible     = $this->input->post('visible');
            $staff_roles = array();
            $inst_staff  = array();
            foreach ($visible as $key => $value) {

                if ($value == "student") {
                    $student = "Yes";
                } else if ($value == "parent") {
                    $parent = "Yes";
                } else if (is_numeric($value)) {
                    $inst_staff[]  = $value;
                    $staff_roles[] = array('role_id' => $value, 'send_notification_id' => '');
                    $staff         = "Yes";
                }
            }

            $to_be_del    = array_diff($prev_roles, $inst_staff);
            $to_be_insert = array_diff($inst_staff, $prev_roles);
            $insert       = array();
            if (!empty($to_be_insert)) {

                foreach ($to_be_insert as $to_insert_key => $to_insert_value) {
                    $insert[] = array('role_id' => $to_insert_value, 'send_notification_id' => '');
                }
            }

            $data = array(
                'id'              => $id,
                'message'         => $this->input->post('message'),
                'title'           => $this->input->post('title'),
                'date'            => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('date'))),
                'created_by'      => $userdata["user_type"],
                'created_id'      => $this->customlib->getStaffID(),
                'visible_student' => $student,
                'visible_staff'   => $staff,
                'visible_parent'  => $parent,
                'publish_date'    => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('publish_date'))),
            );
            $this->notification_model->insertBatch($data, $insert, $to_be_del);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Notification added successfully!</div>');
            redirect('admin/notification/index');
        }
        $exam_result      = $this->exam_model->get();
        $data['examlist'] = $exam_result;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/notification/notificationEdit', $data);
        $this->load->view('layout/footer', $data);
    }

    public function delete($id)
    {
        $userdata = $this->customlib->getUserData();

        $user_id = $userdata["id"];

        $usernotification = $this->notification_model->get($id);

        if ((!$this->rbac->hasPrivilege('notice_board', 'can_edit'))) {
            if ($usernotification['created_id'] != $user_id) {

                access_denied();

            }
        }
        $this->notification_model->remove($id);
        redirect('admin/notification');
    }

    public function setting()
    {
        if (!$this->rbac->hasPrivilege('notification_setting', 'can_edit')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'notification/setting');
        $data                        = array();
        $data['title']               = 'Email Config List';
        $data['notificationMethods'] = $this->customlib->getNotificationModes();
        $notificationlist            = $this->notificationsetting_model->get();
        $data['notificationlist']    = $notificationlist;
        $this->form_validation->set_rules('email_type', 'Email Type', 'required');
        if ($this->input->server('REQUEST_METHOD') == "POST") {
            $student_admission_array = $this->input->post('key_array[]');
            foreach ($student_admission_array as $student_admission_array_key => $student_admission_array_value) {
                $is_mail = 0;
                $is_sms  = 0;
                $is_notification  = 0;
                $a       = $this->input->post($student_admission_array_value . '_mail');

                if (isset($a)) {
                    $is_mail = 1;
                }
                $b = $this->input->post($student_admission_array_value . '_sms');

                if (isset($b)) {
                    $is_sms = 1;
                }
                $c = $this->input->post($student_admission_array_value . '_notification');

                if (isset($c)) {
                    $is_notification = 1;
                }

                $data_insert = array(
                    'type'    => $student_admission_array_value,
                    'is_mail' => $is_mail,
                    'is_sms'  => $is_sms,
                    'is_notification'  => $is_notification,
                );
                $this->notificationsetting_model->add($data_insert);
            }

            $this->session->set_flashdata('msg', '<div class="alert alert-success">Record Updated Successfully</div>');
            redirect('admin/notification/setting');
        }

        $data['title'] = 'Email Config List';
        $this->load->view('layout/header', $data);
        $this->load->view('admin/notification/setting', $data);
        $this->load->view('layout/footer', $data);
    }

    public function read()
    {
        $array           = array('status' => "fail", 'msg' => 'somthing went wrong');
        $notification_id = $this->input->post('notice');
        if ($notification_id != "") {
            $staffid = $this->customlib->getStaffID();
            $data    = $this->notification_model->updateStatusforStaff($notification_id, $staffid);
            $array   = array('status' => "success", 'data' => $data, 'msg' => 'Record updated successfully');
        }

        echo json_encode($array);
    }

}
