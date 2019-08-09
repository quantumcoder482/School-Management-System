<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Book extends Admin_Controller
{

    function __construct()
    {
        parent::__construct();
        $this->load->library('smsgateway');
        $this->load->library('pushnotification');
        $this->load->library('mailsmsconf');
        $this->load->library('encoding_lib');
    }

    public function index()
    {
        if (!$this->rbac->hasPrivilege('books', 'can_view')) {
            access_denied();
        }

        $this->session->set_userdata('top_menu', 'Library');
        $this->session->set_userdata('sub_menu', 'book/index');
        $data['title'] = 'Add Book';
        $data['title_list'] = 'Book Details';
        $listbook = $this->book_model->listbook();
        $data['listbook'] = $listbook;
        $this->load->view('layout/header');
        $this->load->view('admin/book/createbook', $data);
        $this->load->view('layout/footer');
    }

    public function getall()
    {
        if (!$this->rbac->hasPrivilege('books', 'can_view')) {
            access_denied();
        }
        $this->session->set_userdata('top_menu', 'Library');
        $this->session->set_userdata('sub_menu', 'book/getall');
        $data['title'] = 'Add Book';
        $data['title_list'] = 'Book Details';
        $listbook = $this->book_model->getBookwithQty();
        $data['listbook'] = $listbook;


        $this->load->view('layout/header');
        $this->load->view('admin/book/getall', $data);
        $this->load->view('layout/footer');
    }

    function create()
    {
        if (!$this->rbac->hasPrivilege('books', 'can_add')) {
            access_denied();
        }
        $data['title'] = 'Add Book';
        $data['title_list'] = 'Book Details';
        $this->form_validation->set_rules('book_title', 'Book Title', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $listbook = $this->book_model->listbook();
            $data['listbook'] = $listbook;
            $this->load->view('layout/header');
            $this->load->view('admin/book/createbook', $data);
            $this->load->view('layout/footer');
        } else {
            $data = array(
                'book_title' => $this->input->post('book_title'),
                'book_no' => $this->input->post('book_no'),
                'isbn_no' => $this->input->post('isbn_no'),
                'subject' => $this->input->post('subject'),
                'rack_no' => $this->input->post('rack_no'),
                'publisher' => $this->input->post('publisher'),
                'author' => $this->input->post('author'),
                'qty' => $this->input->post('qty'),
                'bookprice' => $this->input->post('bookprice'),
                'postdate' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('postdate'))),
                'description' => $this->input->post('description')
            );
            $this->book_model->addbooks($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Book added successfully</div>');
            redirect('admin/book/index');
        }
    }

    function import()
    {
        if (!$this->rbac->hasPrivilege('books', 'can_add')) {
            access_denied();
        }

        $data['title'] = 'Import Book';
        $data['title_list'] = 'Recently Added Book';
        $session = $this->setting_model->getCurrentSession();


        $userdata = $this->customlib->getUserData();

        $fields = array('book_title', 'book_no', 'isbn_no', 'subject', 'rack_no', 'publisher', 'author', 'qty', 'bookprice', 'postdate', 'description');

        $data["fields"] = $fields;

        $this->form_validation->set_rules('file', 'Image', 'callback_handle_csv_upload');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('layout/header', $data);
            $this->load->view('admin/book/import_book', $data);
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

                            $book_title = $book_data[$i]["book_title"];
                            $book_no = $book_data[$i]["book_no"];
                            $isbn_no = $book_data[$i]["isbn_no"];
                            $subject = $book_data[$i]["subject"];
                            $rack_no = $book_data[$i]["rack_no"];
                            $publisher = $book_data[$i]["publisher"];
                            $author = $book_data[$i]["author"];
                            $qty = $book_data[$i]["qty"];
                            $bookprice = $book_data[$i]["bookprice"];
                            $postdate = $book_data[$i]["postdate"];
                            $description = $book_data[$i]["description"];

                            $insert_data = array(
                                'book_title' => $book_title,
                                'book_no' => $book_no,
                                'isbn_no' => $isbn_no,
                                'subject' => $subject,
                                'rack_no' => $rack_no,
                                'publisher' => $publisher,
                                'author' => $author,
                                'qty' => $qty,
                                'bookprice' => $bookprice,
                                'postdate' => date('Y-m-d', $this->customlib->datetostrtotime($postdate)),
                                'description' => $description
                            );
                            if ($this->book_model->addbooks($insert_data)) {
                                $rowcount++;
                            } else {
                                continue;
                            }
                        }
                        $data['csvData'] = $result;
                        $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">Books imported successfully</div>');
                        $this->session->set_flashdata('msg', '<div class="alert alert-success text-center">Total ' . count($result) . " records found in CSV file. Total " . $rowcount . ' records imported successfully.</div>');
                        // $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">Records already exists.</div>');
                    } else {

                        $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">No Data was found.</div>');
                    }
                } else {

                    $this->session->set_flashdata('msg', '<div class="alert alert-danger text-center">Please upload CSV file only.</div>');
                }
            }

            redirect('admin/book/import');
        }
    }

    function exportformat()
    {
        $this->load->helper('download');
        $filepath = "./backend/import/import_book_sample_file.csv";
        $data = file_get_contents($filepath);
        $name = 'import_book_sample_file.csv';

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
        if (!$this->rbac->hasPrivilege('books', 'can_edit')) {
            access_denied();
        }
        $data['title'] = 'Edit Book';
        $data['title_list'] = 'Book Details';
        $data['id'] = $id;
        $editbook = $this->book_model->get($id);
        $data['editbook'] = $editbook;
        $this->form_validation->set_rules('book_title', 'Book Title', 'trim|required|xss_clean');
        if ($this->form_validation->run() == FALSE) {
            $listbook = $this->book_model->listbook();
            $data['listbook'] = $listbook;
            $this->load->view('layout/header');
            $this->load->view('admin/book/editbook', $data);
            $this->load->view('layout/footer');
        } else {
            $data = array(
                'id' => $this->input->post('id'),
                'book_title' => $this->input->post('book_title'),
                'book_no' => $this->input->post('book_no'),
                'isbn_no' => $this->input->post('isbn_no'),
                'subject' => $this->input->post('subject'),
                'rack_no' => $this->input->post('rack_no'),
                'publisher' => $this->input->post('publisher'),
                'author' => $this->input->post('author'),
                'qty' => $this->input->post('qty'),
                'bookprice' => $this->input->post('bookprice'),
                'postdate' => date('Y-m-d', $this->customlib->datetostrtotime($this->input->post('postdate'))),
                'description' => $this->input->post('description')
            );
            $this->book_model->addbooks($data);
            $this->session->set_flashdata('msg', '<div class="alert alert-success text-left">Book updated successfully</div>');
            redirect('admin/book/index');
        }
    }

    function delete($id)
    {
        if (!$this->rbac->hasPrivilege('books', 'can_delete')) {
            access_denied();
        }
        $data['title'] = 'Fees Master List';
        $this->book_model->remove($id);
        redirect('admin/book/getall');
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
