<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Noticegateway
{

    private $_CI;

    public function __construct()
    {
        $this->_CI = &get_instance();
        $this->_CI->load->model('setting_model');
        $this->_CI->load->model('studentfeemaster_model');
        $this->_CI->load->model('student_model');
        $this->_CI->load->model('teacher_model');
        $this->_CI->load->model('librarian_model');
        $this->_CI->load->model('accountant_model');
        $this->_CI->load->library('pushnotification');

        $this->sch_setting = $this->_CI->setting_model->get();
    }

   

    public function sentNotification($chk_mail_sms, $sender_details)
    {


        $msg=($sender_details['msg']);
     

           $app_students=$this->_CI->student_model->getAppStudents();
           foreach ($app_students as $student_key => $student_value) {
         
           $msg['body']=substr(strip_tags($msg['body']),0,100) . "...";
             $this->_CI->pushnotification->send($student_value->app_key,$msg,"notificaton");
           }
      
    }

    public function sentAddFeeNotification($invoice_id, $sub_invoice_id, $sender_details)
    {

      if(!empty($sender_details['notification_to'])){
        $msg = $this->getAddFeeContent($invoice_id, $sub_invoice_id,$sender_details);

      }
  
    }

    public function sentExamResultNotification($detail)
    {
    if(!empty($detail['notification_to'])){

            $msg = $this->getStudentResultContent($detail);
    }
           
    }

    public function sentAbsentStudentNotification($detail)
    {

        $parent_app_key = $detail['parent_app_key'];
        if ($parent_app_key != "") {
         $this->getAbsentStudentContent($detail);
   
         
        }
    }

    public function getAddFeeContent($invoice_id, $sub_invoice_id,$sender_details)
    {
        $msg=array();
        $currency_symbol = $this->sch_setting[0]['currency_symbol'];
        $school_name     = $this->sch_setting[0]['name'];
        $fee        = $this->_CI->studentfeemaster_model->getFeeByInvoice($invoice_id, $sub_invoice_id);
        $a          = json_decode($fee->amount_detail);
        $record     = $a->{$sub_invoice_id};
        $fee_amount = number_format((($record->amount + $record->amount_fine) - $record->amount_discount), 2, '.', ',');
        $msg['title']='Fees Received';
        $msg['body']        = "Fees received for " . $fee->firstname . " " . $fee->lastname . ". Fees Amount " . $currency_symbol . $fee_amount . "/- Received by " . $school_name;
        foreach ($sender_details['notification_to'] as $notice_key => $notice_value) {
            if($notice_value != ""){

              $this->_CI->pushnotification->send($notice_value, $msg,"fees");
            }
        }
      
    }

    public function getAbsentStudentContent($student_detail)
    {
        if($student_detail['parent_app_key'] != ""){
        $msg=array();
        $msg['title']="Absent Notification";
        $school_name  = $this->_CI->setting_model->getCurrentSchoolName();
        $student_name = $student_detail['student_name'];
        $msg['body']          = "Absent Notice : " . $student_name . " was absent on date " . $student_detail['date'] . " from " . $school_name;
        $this->_CI->pushnotification->send($student_detail['parent_app_key'], $msg,"absent");
        }
    }

 

    public function getStudentResultContent($student_result_detail)
    {

        $school_name  = $this->_CI->setting_model->getCurrentSchoolName();
        $student_name = $student_result_detail['student_name'];

        $msg_body = $student_name . " is " . $student_result_detail['result'] . " in " . $student_result_detail['exam_name'] . " with total marks " . $student_result_detail['achive_marks'] . " out of " . $student_result_detail['total_marks'] . ".";
        
            foreach ($student_result_detail['notification_to'] as $notice_key => $notice_value) {
            if($notice_value != ""){

                $msg=array();
                $msg['title']= "Exam Result";
                $msg['body']  =$msg_body;

                $this->_CI->pushnotification->send($notice_value, $msg,"exam");
            }
        }

        
    }

}
