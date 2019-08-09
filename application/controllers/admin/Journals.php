<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Journals extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->library('smsgateway');
        $this->load->library('pushnotification');
        $this->load->library('mailsmsconf');
        $this->load->library('encoding_lib');
        $this->load->model('journal_model');
    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('journals', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Library');
        $this->session->set_userdata('sub_menu', 'journals/index');
        $data['title'] = 'Add Journal';
        $data['title_list'] = 'Journal Details';
        $listjournal = $this->journal_model->listjournal();
        $data['listjournal'] = $listjournal;
        $this->load->view('layout/header');
        $this->load->view('admin/journals/createjournal', $data);
        $this->load->view('layout/footer');
    }

    public function getall()
    {
        if (!$this->rbac->hasPrivilege('journals', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Library');
        $this->session->set_userdata('sub_menu', 'journals/getall');
        $data['title'] = 'Add Journal';
        $data['title_list'] = 'Journal Details';
        $listjournal = $this->journal_model->getJournalwithQty();
        $data['listjournal'] = $listjournal;


        $this->load->view('layout/header');
        $this->load->view('admin/journals/getall', $data);
        $this->load->view('layout/footer');
    }

    function create()
    {
        if (!$this->rbac->hasPrivilege('journals', 'can_add')) {
            access_denied();
        }
        $data['title'] = 'Add Journal';
        $data['title_list'] = 'Journal Details';
        $this->form_validation->set_rules('journal_title', 'Journal Title', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $listjournal = $this->journal_model->listjournal();
            $data['listjournal'] = $listjournal;
            $this->load->view('layout/header');
            $this->load->view('admin/journals/createjournal', $data);
            $this->load->view('layout/footer');
        } else {
            $data = array(
                'journal_title' => $this->input->post('journal_title'),
                'journal_no' => $this->input->post('journal_no'),
                'issn_no' => $this->input->post('issn_no'),
                'subject' => $this->input->post('subject'),
                'rack_no' => $this->input->post('rack_no'),
                'publisher' => $this->input->post('publisher'),
                'author' => $this->input->post('author'),
                'qty' => $this->input->post('qty'),
                'journalprice' => $this->input->post('journalprice'),
                'postdate' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('postdate'))),
                'description' => $this->input->post('description')
            );
            $this->journal_model->addjournals($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Journal added successfully</div>');
            redirect('admin/journals/index');
        }
    }

    function import()
    {
        if (!$this->rbac->hasPrivilege('journals', 'can_add')) {
            access_denied();
        }

        $data['title'] = 'Import Jounals';
        $data['title_list'] = 'Recently Added Journal';
        $session = $this->setting_model->getCurrentSession();


        $userdata = $this->customlib->getUserData();

        $fields = array('journal_title', 'journal_no', 'issn_no', 'subject', 'rack_no', 'publisher', 'author', 'qty', 'journalprice', 'postdate', 'description');

        $data["fields"] = $fields;

        $this->form_validation->set_rules('file', 'Image', 'callback_handle_csv_upload');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/journals/import_journal', $data);
            $this->load->view('layout/footer', $data);
        } else {

            $session = $this->setting_model->getCurrentSession();

            if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
                $ext = pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
                if ($ext == 'csv') {
                    $file = $_FILES['file']['tmp_name'];
                    $this->load->library('CSVReader');
                    $result = $this->csvreader->parse_file($file);
                    if (!empty($result)) {
                        $rowcount = 0;
                        for ($i = 1; $i <= count($result); $i++) {

                            $book_data[$i] = array();
                            $n = 0;

                            foreach ($result[$i] as $key => $value) {

                                $book_data[$i][$fields[$n]] = $this->encoding_lib->toUTF8($result[$i][$key]);

                                // $book_data[$i]['is_active'] = 'yes';
                                $n++;
                            }

                            $journal_title = $book_data[$i]["journal_title"];
                            $journal_no = $book_data[$i]["journal_no"];
                            $issn_no = $book_data[$i]["issn_no"];
                            $subject = $book_data[$i]["subject"];
                            $rack_no = $book_data[$i]["rack_no"];
                            $publisher = $book_data[$i]["publisher"];
                            $author = $book_data[$i]["author"];
                            $qty = $book_data[$i]["qty"];
                            $journalprice = $book_data[$i]["journalprice"];
                            $postdate = $book_data[$i]["postdate"];
                            $description = $book_data[$i]["description"];

                            $insert_data = array(
                                'journal_title' => $journal_title,
                                'journal_no' => $journal_no,
                                'issn_no' => $issn_no,
                                'subject' => $subject,
                                'rack_no' => $rack_no,
                                'publisher' => $publisher,
                                'author' => $author,
                                'qty' => $qty,
                                'journalprice' => $journalprice,
                                'postdate' => date('Y-m-d', $this->customlib->datetostrtotime($postdate)),
                                'description' => $description
                            );
                            if ($this->journal_model->addjournals($insert_data)) {
                                $rowcount++;
                            } else {
                                continue;
                            }
                        }
                        $data['csvData'] = $result;
                        $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">Journals imported successfully</div>');
                        $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">Total ' . count($result) . " records found in CSV file. Total " . $rowcount . ' records imported successfully.</div>');
                        // $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">Records already exists.</div>');
                    } else {

                        $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">No Data was found.</div>');
                    }
                } else {

                    $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">Please upload CSV file only.</div>');
                }
            }

            redirect('admin/journals/import');
        }
    }

    function exportformat()
    {
        $this->load->helper('download');
        $filepath = "./backend/import/import_journals_sample_file.csv";
        $data = file_get_contents($filepath);
        $name = 'import_journals_sample_file.csv';

        force_download($name, $data);
    }

    function handle_csv_upload()
    {

        $error = "";
        if (isset($_FILES["file"]) && !empty($_FILES['file']['name'])) {
            $allowedExts = array('csv');
            $mimes = array(
                'text/csv',
                'text/plain',
                'application/csv',
                'text/comma-separated-values',
                'application/excel',
                'application/vnd.ms-excel',
                'application/vnd.msexcel',
                'text/anytext',
                'application/octet-stream',
                'application/txt'
            );
            $temp = explode(".", $_FILES["file"]["name"]);
            $extension = end($temp);
            if ($_FILES["file"]["error"] > 0) {
                $error .= "Error opening the file<br />";
            }
            if (!in_array($_FILES['file']['type'], $mimes)) {
                $error .= "Error opening the file<br />";
                $this->form_validation->set_message('handle_csv_upload', 'File type not allowed');
                return false;
            }
            if (!in_array($extension, $allowedExts)) {
                $error .= "Error opening the file<br />";
                $this->form_validation->set_message('handle_csv_upload', 'Extension not allowed');
                return false;
            }
            if ($error == "") {
                return true;
            }
        } else {
            $this->form_validation->set_message('handle_csv_upload', 'Please Select file');
            return false;
        }
    }

    function edit($id)
    {
        if (!$this->rbac->hasPrivilege('journals', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Edit Journal';
        $data['title_list'] = 'Journal Details';
        $data['id'] = $id;
        $editjournal = $this->journal_model->get($id);
        $data['editjournal'] = $editjournal;
        $this->form_validation->set_rules('journal_title', 'Journal Title', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $listjournal = $this->journal_model->listjournal();
            $data['listjournal'] = $listjournal;
            $this->load->view('layout/header');
            $this->load->view('admin/journals/editjournal', $data);
            $this->load->view('layout/footer');
        } else {
            $data = array(
                'id' => $this->input->post('id'),
                'journal_title' => $this->input->post('journal_title'),
                'journal_no' => $this->input->post('journal_no'),
                'issn_no' => $this->input->post('issn_no'),
                'subject' => $this->input->post('subject'),
                'rack_no' => $this->input->post('rack_no'),
                'publisher' => $this->input->post('publisher'),
                'author' => $this->input->post('author'),
                'qty' => $this->input->post('qty'),
                'journalprice' => $this->input->post('journalprice'),
                'postdate' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('postdate'))),
                'description' => $this->input->post('description')
            );
            $this->journal_model->addbooks($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Book updated successfully</div>');
            redirect('admin/journals/index');
        }
    }

    function delete($id)
    {
        if (!$this->rbac->hasPrivilege('journals', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Fees Master List';
        $this->journal_model->remove($id);
        redirect('admin/journals/getall');
    }

    public function getAvailQuantity()
    {

        $book_id = $this->input->post('book_id');
        $available = 0;
        if ($book_id != "") {
            $result = $this->bookissue_model->getAvailQuantity($book_id);
            $available = $result->qty - $result->total_issue;
        }
        $result_final = array('status' => '1', 'qty' => $available);
        echo json_encode($result_final);
    }
}
