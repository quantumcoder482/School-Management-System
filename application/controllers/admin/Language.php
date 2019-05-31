<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Language extends Admin_Controller {

    public function __construct() {
        parent::__construct();
    }

    function index() {
        $this->session->set_userdata('top_menu', 'System Settings');
        $this->session->set_userdata('sub_menu', 'language/index');
        $data['title'] = 'Language List';
        $language_result = $this->language_model->get();
        $data['languagelist'] = $language_result;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/language/languageList', $data);
        $this->load->view('layout/footer', $data);
    }

    function view($id) {
        $data['title'] = 'Language List';
        $language = $this->language_model->get($id);
        $data['language'] = $language;
        $this->load->view('layout/header', $data);
        $this->load->view('admin/language/sectionShow', $data);
        $this->load->view('layout/footer', $data);
    }

    function editlanguage() {
        $recordid = $this->input->post('recordid');
        $key_id = $this->input->post('key_id');
        $languageid = $this->input->post('langid');
        $pharses_value = $this->input->post('value');
        if ($recordid == 0 && $pharses_value == "") {
            
        } else if ($recordid > 0) {
            $d = array('id' => $recordid, 'pharses' => $pharses_value, 'lang_id' => $languageid);
            $this->langpharses_model->add($d);
        } else if ($recordid == 0 && $pharses_value != "") {
            $d = array('key_id' => $key_id, 'pharses' => $pharses_value, 'lang_id' => $languageid);
            $this->langpharses_model->add($d);
        }
        $arr = array('status' => 1, 'message' => 'Record Updated');
        echo json_encode($arr);
    }

    function delete($id) {
        $selected_lang = $this->customlib->getSessionLanguage();
        $language = $this->language_model->get($id);
        $data['title'] = 'Language List';

        if ($language['is_deleted'] == "no") {
            $this->session->set_flashdata('msg', '<div class="alert alert-info">Default language cannot be deleted. </div>');
        } else {
            if ($selected_lang == $id) {
                $this->session->set_flashdata('msg', '<div class="alert alert-info">You cannot delete your current selected language. </div>');
            } else {
                $this->language_model->remove($id);
                $this->langpharses_model->deletepharses($id);
                $this->session->set_flashdata('msg', '<div class="alert alert-success">Language deleted successfully. </div>');
            }
        }
        redirect('admin/language/index');
    }

    function create() {
        if (!$this->rbac->hasPrivilege('languages', 'can_add')) {
            access_denied();
        }
        $data['title'] = 'Add Language';

        $this->form_validation->set_rules(
                'language', 'Language', array(
            'required',
            array('check_exists', array($this->language_model, 'valid_check_exists'))
                )
        );

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/language/languageCreate', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $directory = APPPATH . '/language/' . $this->input->post('language');
            if (!is_dir($directory)) {
                mkdir($directory, 0777);
                $fromDir = APPPATH . '/language/english';
                $this->copydirr($fromDir, $directory, $chmod = 0757, $verbose = false);
            }
            $data = array(
                'language' => $this->input->post('language'),
            );
            $this->language_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success">Language added successfully</div>');
            redirect('admin/language/index');
        }
    }

    function addPharses($id) {
        $language = $this->language_model->get($id);
        $data['title'] = 'Edit Pharses for ' . $language['language'];
        $data['lang1'] = $language['language'];
        $language_pharses = $this->langpharses_model->get($id);

        $data['language_pharses'] = $language_pharses;
        $data['id'] = $id;
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            $ar = $this->input->post('i[]');
            foreach ($ar as $key => $a) {
                $pharsesid = $this->input->post('pharsesid' . $a);
                $pharses_value = $this->input->post('pharses' . $a);
                $languageid = $this->input->post('languageid');
                if ($pharsesid == 0 && $pharses_value == "") {
                    
                } else if ($pharsesid > 0) {
                    $d = array('id' => $pharsesid, 'pharses' => $pharses_value, 'lang_id' => $languageid);
                    $this->langpharses_model->add($d);
                } else if ($pharsesid == 0 && $pharses_value != "") {
                    $d = array('key_id' => $a, 'pharses' => $pharses_value, 'lang_id' => $languageid);
                    $this->langpharses_model->add($d);
                }
            }
            redirect('admin/language/addPharses/' . $languageid);
        } else {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/language/addPharse', $data);
            $this->load->view('layout/footer', $data);
        }
    }

    function edit($id) {
        $data['title'] = 'Edit Language';
        $data['id'] = $id;
        $section = $this->language_model->get($id);
        $data['section'] = $section;
        $this->form_validation->set_rules('section', 'Language', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/language/sectionEdit', $data);
            $this->load->view('layout/footer', $data);
        } else {
            $data = array(
                'id' => $id,
                'section' => $this->input->post('section'),
            );
            $this->language_model->add($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">Language updated successfully</div>');
            redirect('sections/index');
        }
    }

    public function migratelang() {

        $data = array();
        $this->load->library('langconvert');
        $language_pharses = $this->langpharses_model->getByLangAfter(4, 691);
        $language_id = 90; // change language id.
        $convert_from = 'en'; //change from langauge
        $convert_to = 'en'; //change to langauge
        $text = "";
        end($language_pharses);
        $key_end = key($language_pharses);
        foreach ($language_pharses as $key => $value) {
            $string = $value['pharses'];
            // $string= str_replace('_', " ", $value['key']);
            if ($key_end != $key) {
                $text .= $value['id'] . " " . $string . "\n";
            } else {
                $text .= $value['id'] . " " . $string;
            }
        }

        $result = $this->langconvert->yandexTranslate($convert_from, $convert_to, $text);
        $json_result = json_decode($result);

        $a = explode("<br />", $json_result->text[0]);
        $array = array();
        foreach ($a as $a_key => $a_value) {
            preg_match_all('/\d+/', $a_value, $matches);
            $text = preg_replace('/\d+/u', '', $a_value);
            $key_id = $matches[0];
            $data = array(
                'lang_id' => $language_id,
                'key_id' => $key_id[0],
                'pharses' => mb_convert_case(ltrim($text), MB_CASE_TITLE, "UTF-8")
            );


            $array[] = $data;
        }
        print_r($array);
        exit();
        $this->db->insert_batch('lang_pharses', $array);
        echo "Record Inserted successfully";
        exit();
    }

    function copydirr($fromDir, $toDir, $chmod = 0757, $verbose = false) {

        $errors = array();
        $messages = array();
        if (!is_writable($toDir))
            $errors[] = 'target ' . $toDir . ' is not writable';
        if (!is_dir($toDir))
            $errors[] = 'target ' . $toDir . ' is not a directory';
        if (!is_dir($fromDir))
            $errors[] = 'source ' . $fromDir . ' is not a directory';
        if (!empty($errors)) {
            if ($verbose)
                foreach ($errors as $err)
                    echo '<strong>Error</strong>: ' . $err . '<br />';
            return false;
        }
//*/
        $exceptions = array('.', '..');
//* Processing
        $handle = opendir($fromDir);
        while (false !== ($item = readdir($handle)))
            if (!in_array($item, $exceptions)) {
                //* cleanup for trailing slashes in directories destinations
                $from = str_replace('//', '/', $fromDir . '/' . $item);
                $to = str_replace('//', '/', $toDir . '/' . $item);
                //*/
                if (is_file($from)) {
                    if (@copy($from, $to)) {
                        chmod($to, $chmod);
                        touch($to, filemtime($from)); // to track last modified time
                        $messages[] = 'File copied from ' . $from . ' to ' . $to;
                    } else
                        $errors[] = 'cannot copy file from ' . $from . ' to ' . $to;
                }
                if (is_dir($from)) {
                    if (@mkdir($to)) {
                        chmod($to, $chmod);
                        $messages[] = 'Directory created: ' . $to;
                    } else
                        $errors[] = 'cannot create directory ' . $to;
                    $this->copydirr($from, $to, $chmod, $verbose);
                }
            }
        closedir($handle);

        return true;
    }

    function active_language($language_id) {

        $this->load->model("setting_model");
        $setting_result = $this->setting_model->get();
        $id = $setting_result[0]["id"];
        $data = array('id' => $id, 'lang_id' => $language_id);
        $this->setting_model->add($data);
        $this->load->helper('lang');
        set_language($language_id);
        redirect('admin/language');
    }

    function write_lang_file($language, $writedata) {

        if (!is_dir(FCPATH . "application/language/" . $language)) {

            mkdir(FCPATH . "application/language/" . $language);
            mkdir(FCPATH . "application/language/" . $language . "/app_files");
            $my_file = FCPATH . "application/language/" . $language . "/app_files/system_lang.php";
            $handle = fopen($my_file, 'w') or die('Cannot open file:  ' . $my_file);

            $sta = '$lang[';
            fwrite($handle, "<?php" . "\n");
            $i = 0;
            $tr = '"';
            foreach ($writedata as $sakey => $savalue) {

                $data = $sta . "'" . $savalue["key"] . "'] =  " . $tr . $savalue["pharses"] . $tr . ";";

                print_r($data . "<br/>");
                fwrite($handle, $data . "\n");
            }

            fwrite($handle, "?>" . "\n");
            $i++;
        }
        echo $i;
    }

    function create_language_file() {


        //$lang_id = 81;
        // $language = 'testfrench';
        $language_result = $this->language_model->get();

        foreach ($language_result as $langkey => $langvalue) {
            $lang_id = $langvalue["id"];
            $language = $langvalue["language"];

            $key_query = $this->db->select("*")->order_by("key", "asc")->get("lang_keys");
            $result = $key_query->result_array();
            $lang_arr = array();
            $i = 0;
            foreach ($result as $key => $value) {

                $id = $value["id"];
                $key = $value["key"];
                $pharses_query = $this->db->select("*")->where("key_id", $id)->where("lang_id", $lang_id)->get("lang_pharses");
                $lang_pharses_data = $pharses_query->row_array();
                $pharses = $lang_pharses_data["pharses"];
                $lang_arr[$i]["key"] = $key;
                $lang_arr[$i]["pharses"] = $pharses;
                $i++;
            }
            $this->write_lang_file($language, $lang_arr);
        }
    }

}

?>