<?php

require_once 'Repository.php';

class PlanRepository extends Repository
{

    public function insertPlan(string $username): ?User
    {
        $result  = pg_query($this->connection, "SELECT id,username, password FROM users WHERE username = '" . $username . "'");
        if (!$result) {
            return null;
        }
        while ($row = pg_fetch_row($result)) {
            $user = new User($row[0], $row[1], $row[2]);
        }
        if (!$user) {
            return null;
        } else
            return $user;
    }
}
