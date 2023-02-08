<?php
require_once 'AppController.php';

class DefaultController extends AppController
{
    public function checkLogin()
    {
        if ($_SESSION["user_id"] == null)
            return $this->render('login', ['messages' => ['Firstly login to service']]);
    }


    public function index()
    {
        $this->checkLogin();
        $this->render("index");
    }

    public function register()
    {
        $this->render("register");
    }
    public function login()
    {
        $this->render("login");
    }
    public function create()
    {
        $this->checkLogin();
        $this->render("create");
    }
    public function statistics()
    {
        $this->checkLogin();
        $this->render("statistics");
    }
}
