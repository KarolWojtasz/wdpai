<?php

require_once "Config.php";

class Database
{
    private $connection_string;

    public function __construct()
    {
        $this->connection_string = CONNECTION_STRING;
    }


    function connect()
    {
        try {

            $conn = pg_connect($this->connection_string);
            return $conn;
        } catch (PDOException $e) {
            echo "ERROR";
            return null;
            die($e->getMessage());
        }
    }
}
