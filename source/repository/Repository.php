<?php

require_once __DIR__ . '/../../Database.php';

class Repository
{
    public $connection;

    public function __construct()
    {
        $db = new Database();
        $this->connection = $db->connect();
    }
}
