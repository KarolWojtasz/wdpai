<?php
require_once 'AppController.php';

class DefaultController extends AppController{
    
    public function index(){
        $this->render("index");
    }
    
    public function register(){
        $this->render("register");
    }    

    public function login(){
        $this->render("login");
    }
    public function create(){
        $this->render("create");
    }
    public function statistics(){
        $this->render("statistics");
    }
    public function training(){
        $this->render("training");
    }
}
?>