<?php

require_once "source/controllers/DefaultController.php";
require_once "source/controllers/SecurityController.php";
require_once "source/controllers/PlanController.php";
class Router
{
  public static $routes;

  public static function get($url, $view)
  {
    self::$routes[$url] = $view;
  }
  public static function post($url, $view)
  {
    self::$routes[$url] = $view;
  }

  public static function run($url)
  {
    $action = explode("/", $url)[0];

    if (!array_key_exists($action, self::$routes))
      die("Wrong url");

    $controller = self::$routes[$action];
    $object = new $controller;
    $action = $action ?: 'login';

    $object->$action();
  }
}
