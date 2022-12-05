<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN - Liftology</title>
    <link rel="stylesheet" type="text/css" href="public/css/style.css">
</head>

<body>
    <div id="container">
        <section id="formContainer">
            <div id="whiteBox">
                <h2>LOGIN</h2>
                <form method="POST" action="login">
                    <input type="text" name="username" placeholder="USERNAME" />
                    <input type="password" name="password" placeholder="PASSWORD" />
                    <input type="submit" value="OK"/>
                    <?php
                    if(isset($messages)){
                        foreach($messages as $message){
                            echo $message;
                        }
                    }
                ?>
                </form>

            </div>
        </section>
        <section id="nameContainer">
            <h1>Liftology</h1>
            <h3>Track your progress</h3>
        </section>
    </div>
</body>

</html>