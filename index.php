<?php 
require "Router.php";
require "Database.php";
$path = trim($_SERVER['REQUEST_URI'],'/');
$path = parse_url($path,PHP_URL_PATH);
$conn = new Database;
$database = $conn->getInstance();
Router::get("index","DefaultController");
Router::get('register', 'DefaultController');
Router::get('login', 'DefaultController');
Router::get('create', 'DefaultController');
Router::get('statistics', 'DefaultController');
Router::get('training', 'DefaultController');
Router::post('login', 'SecurityController');
Router::run($path);
?>