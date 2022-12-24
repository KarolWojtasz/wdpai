<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create workout - Liftology</title>
    <link rel="stylesheet" type="text/css" href="public/css/global.css">
    <link rel="stylesheet" type="text/css" href="public/css/statistics.css">

</head>

<body>
    <?php include("nav.php"); ?>
    <div id="container">

        <h2>Exercise Statistics</h2>

        <div id="statsContainer">
            <h4>Bench press</h4>
            <div id="photo_max">
                <img src="/public/img/logo.png">
                <h6>Your best: 100kg per 4 reps</h6>
            </div>
            <div id="history">
                <section id="history_links">
                    <p>See previous trainings:</p>
                    <a>22.10.2022</a>
                    <a>17.10.2022</a>
                    <a>12.10.2022</a>
                </section>

                <section id="last_training">
                    <p id="last_training_date">Last trained: 25.10.2022</p>
                    <div id="last_training_box">
                        <div id="reps">
                            <h6>Reps</h6>
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
                </section>
            </div>
        </div>



    </div>
</body>

</html>