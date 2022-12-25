<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Training - Liftology</title>
    <link rel="stylesheet" type="text/css" href="public/css/global.css">
    <link rel="stylesheet" type="text/css" href="public/css/training.css">

</head>

<body>
    <?php include("nav.php"); ?>
    <div id="container">

        <h2>Workout in progress</h2>

        <div id="statsContainer">
            <h4>Training A</h4>
            <div id="photo_max">
                <img src="/public/img/logo.png">
                <h6>Box Squat</h6>
            </div>
            <div id="history">
                <section id="last_training">
                    <div id="last_training_box">
                        <div id="reps">
                            <h6>Reps done</h6>
                            <p>8</p>
                            <p>8</p>
                            <p>6</p>
                        </div>
                        <div id="weight">
                            <h6>Weight</h6>
                            <p>100</p>
                            <p>100</p>
                            <p>100</p>
                        </div>
                    </div>
                    <button id="addReps">+</button>
                </section>
            </div>
            <div id="buttonsContainer">
                <button>Previous exercise</button>
                <button>Finish workout</button>
                <button>Next exercise</button>
            </div>

        </div>



    </div>
</body>
</html>