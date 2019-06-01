<?php

$config['staffattendance'] = array(
    'present' => 1,
    'half_day' => 4,
    'late' => 2,
    'absent' => 3,
    'holiday' => 5
);

$config['contracttype'] = array(
    'permanent' => 'Permanent',
    'probation' => 'Probation',
);

$config['status'] = array(
    'approve' => 'Approve',
    'disapprove' => 'Disapprove',
    'pending' => 'Pending',
);

$config['marital_status'] = array(
    'Single' => 'Single',
    'Married' => 'Married',
    'Widowed' => 'Widowed',
    'Seperated' => 'Seperated',
    'Not Specified' => 'Not Specified',
);

$config['payroll_status'] = array(
    'generated' => 'Generated',
    'paid' => 'Paid',
    'unpaid' => 'Unpaid',
    'not_generate' => 'Not Generated',
);
$config['payment_mode'] = array(
    'cash' => 'Cash',
    'cheque' => 'Cheque',
    'online' => 'Transfer to Bank Account',
);
$config['enquiry_status'] = array(
    'active' => 'Active',
    'passive' => 'Passive',
    'dead' => 'Dead',
    'won' => 'Won',
    'lost' => 'Lost',
);
