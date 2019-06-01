<?php

if (!defined('BASEPATH')) {
    exit('No direct script access allowed');
}

class Pushnotification
{

    public $CI;

    public $API_ACCESS_KEY = "AAAAZDTRjsM:APA91bFfPp3Z3EewvMs3pcLKiR4XnlL7dPbHuR6vUIdURwZMu0YlHZ_y9Q_g7fn8mUt7JG_RvK47Xn5PfuhWc-CYi_YtYw5O3qC7pzTJ9cyBb5GNb0aI9xLn0qKGXrncN6HqwTif2fgA";
    public $fcmUrl         = "https://fcm.googleapis.com/fcm/send";

    public function __construct()
    {
        $this->CI = &get_instance();

    }

    public function send($tokens, $msg, $action="")
    {
       

        if (!empty($tokens)) {

            $notificationData = [
                'title'  => $msg['title'],
                'body'   => $msg['body'],
                'action' => $action,
                'sound' => 'mySound'
            ];

            $fcmNotification = [

                'to'          => $tokens, //single token
                'collapseKey' => "{$tokens}",
                'data'        => $notificationData,

            ];
            $headers = [
                'Authorization: key=' . $this->API_ACCESS_KEY,
                'Content-Type: application/json',
            ];

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $this->fcmUrl);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));
            $result = curl_exec($ch);
            curl_close($ch);

            return true;
        }
    }

}
