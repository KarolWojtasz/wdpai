<?php
session_start();
require_once "Router.php";
$path = trim($_SERVER['REQUEST_URI'], '/');
$path = parse_url($path, PHP_URL_PATH);
Router::get("index", "DefaultController");
Router::get('register', 'DefaultController');
Router::get('login', 'DefaultController');
Router::get('create', 'DefaultController');
Router::get('plans', 'PlanController');
Router::get('statistics', 'DefaultController');
Router::get('training', 'PlanController');
Router::get('logout', 'SecurityController');
Router::post('login', 'SecurityController');
Router::post('register', 'SecurityController');
Router::post('savePlan', 'PlanController');
Router::post('saveTraining', 'PlanController');
Router::get('', 'DefaultController');

Router::run($path);
