<?php

require_once 'Repository.php';
require_once __DIR__ . '/../models/User.php';

class UserRepository extends Repository
{

    public function getUser(string $username): ?User
    {
        $result  = pg_query($this->connection, "SELECT username, password FROM users WHERE username = '" . $username . "'");
        if (!$result) {
            return null;
        }
        while ($row = pg_fetch_row($result)) {
            $user = new User($row[0], $row[1]);
        }
        if (!$user) {
            return null;
        } else
            return $user;
    }
    public function addUser(User $user)
    {
        $result  = pg_query($this->connection, "
            INSERT INTO users (username, password, type)
            VALUES ('" . $user->getUsername() . "', '" . $user->getPassword() . "', 'normal')
        ");
        var_dump($result);
    }
}
