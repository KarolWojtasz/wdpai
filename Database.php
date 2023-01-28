<?php

require_once "Config.php";

class Database {
    private $connection_string;

    public function __construct()
    {
        $this->connection_string = CONNECTION_STRING;
        $this->instance = $this->getInstance();
    }
    function getInstance(){

        if($this->instance == null){
            $this->instance = $this->connect();
        }
        return $this->instance;
    }

    function connect()
    {
        try {

            $pdo = pg_connect("postgres://vkggaimu:jBESVv7RPmdwDhY7NfovaNrX9DnPfTNz@trumpet.db.elephantsql.com/vkggaimu");
            if ($pdo) {
                return $pdo;
            }
        } catch (PDOException $e) {
            echo "ERROR";
            return null;
            die($e->getMessage());
        } 
    }
}