<?php

require_once 'Repository.php';
require_once __DIR__ . '/../models/User.php';

class UserRepository extends Repository
{

    public function getUser(string $username): ?User
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
    public function addUser(User $user)
    {
        $result  = pg_query($this->connection, "
            INSERT INTO users (username, password)
            VALUES ('" . $user->getUsername() . "', '" . $user->getPassword() . "')
        ");
        echo $result;
        if (!$result) {
            return false;
        } else {
            return true;
        }
    }
}
