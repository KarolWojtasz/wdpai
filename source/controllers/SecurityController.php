<?php
require_once 'AppController.php';
require_once __DIR__ . '/../models/User.php';
require_once __DIR__ . '/../repository/UserRepository.php';

class SecurityController extends AppController
{

    public function login()
    {
        $userRepository = new UserRepository();

        if (!$this->isPost()) {
            return $this->render('login');
        }

        $username = $_POST['username'];
        $password = $_POST['password'];
        $user = $userRepository->getUser($username);
        if (!$user) {
            return $this->render('login', ['messages' => ['User with this username not exist!']]);
        }

        if (password_verify($password, $user->getPassword())) {
            $url = "http://$_SERVER[HTTP_HOST]";
            header("Location: {$url}/index");
        } else {
            return $this->render('login', ['messages' => ['Wrong password!']]);
        }
    }

    public function register()
    {
        $userRepository = new UserRepository();
        if (!$this->isPost()) {
            return $this->render('register');
        }

        $username = $_POST['username'];
        $password = $_POST['password'];
        $user = $userRepository->getUser($username);
        if ($user) {
            return $this->render('register', ['messages' => ['User with this username already exist!']]);
        }
        $user = new User($username, password_hash($password, PASSWORD_DEFAULT));

        $userRepository->addUser($user);

        return $this->render('login', ['messages' => ['You\'ve been succesfully registrated!']]);
    }
}
