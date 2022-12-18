<?php 
require "Router.php";

$path = trim($_SERVER['REQUEST_URI'],'/');
$path = parse_url($path,PHP_URL_PATH);

Router::get("index","DefaultController");
Router::get('register', 'DefaultController');
Router::get('login', 'DefaultController');
Router::get('create', 'DefaultController');
Router::post('login', 'SecurityController');
Router::run($path);
?>