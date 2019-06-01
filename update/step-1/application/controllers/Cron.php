<?php

class Cron extends CI_Controller {

    public function autobackup($key = '') {

        $setting_result = $this->setting_model->get();
        $data['settinglist'] = $setting_result;

        $cronkey = $setting_result[0]["cron_secret_key"];
        if ($cronkey == $key) {

            $this->load->dbutil();
            $filename = "db-" . date("Y-m-d_H-i-s") . ".sql";
            $prefs = array(
                'ignore' => array(),
                'format' => 'txt',
                'filename' => 'mybackup.sql',
                'add_drop' => TRUE,
                'add_insert' => TRUE,
                'newline' => "\n"
            );
            $backup = $this->dbutil->backup($prefs);
            $this->load->helper('file');
            write_file('./backup/database_backup/' . $filename, $backup);
            echo "success";
        } else {

            echo "Please pass Cron Secret Key or passed Cron Secret Key is not valid";
        }
    }

}

?>