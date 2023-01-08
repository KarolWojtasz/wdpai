<?php

class Database {
    private $username;
    private $password;
    private $host;
    private $database;

    public function __construct()
    {
        $this->username = getenv('DB_USER');
        $this->password = getenv('DB_PASSWORD');
        $this->host = getenv('DB_HOST');
        $this->database = getenv('DB_NAME');
    }

    public function connect()
    {
        try {
            $conn = new PDO(
                "pgsql:host=db;port=5432;dbname=dbname",
                "dbuser",
                "dbpwd",
                ["sslmode"  => "prefer"]
            );

            // set the PDO error mode to exception
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;
        }
        catch(PDOException $e) {
            die("Connection failed: " . $e->getMessage());
        }
    }
}