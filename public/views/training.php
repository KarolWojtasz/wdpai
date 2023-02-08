<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Training - Liftology</title>
    <link rel="stylesheet" type="text/css" href="public/css/global.css">
    <link rel="stylesheet" type="text/css" href="public/css/training.css">
    <script defer type="text/javascript" src="public/script/training.js"></script>

</head>

<body>
    <?php include("nav.php"); ?>
    <div id="container">

        <h2>Workout in progress</h2>
        <div id="selectContainer">
            <h3>Select training day and start training</h3>
            <input id="allPlans" value='<?php echo json_encode($plans); ?>' type="hidden" />
            <select id="selectDay">
                <?php foreach ($plans as $planName => $trainingDays) : ?>
                    <optgroup label="<?php echo $planName; ?>">
                        <?php foreach ($trainingDays as $trainingDayName => $exercises) : ?>
                            <option value="<?php echo $trainingDayName; ?>"><?php echo $trainingDayName; ?></option>
                        <?php endforeach; ?>
                    </optgroup>
                <?php endforeach; ?>
            </select>


            <button id="confirmPlan">Start workout in this training day</button>
        </div>
        <div id="statsContainer">
            <h4 id="DayTitle">Training A</h4>
            <div id="photo_max">
                <img id="exerciseImage" src="/public/img/logo.png">
                <h6 id="exercisename">Box Squat</h6>
            </div>
            <div id="history">
                <section id="last_training">
                    <div id="last_training_box">
                        <div id="reps">
                            <h6>Reps done</h6>
                        </div>
                        <div id="weight">
                            <h6>Weight</h6>
                        </div>
                    </div>
                </section>
            </div>
            <div id="buttonsContainer">
                <button id="previous">Previous exercise</button>
                <button id="finish">Finish workout</button>
                <button id="next">Next exercise</button>
            </div>

        </div>



    </div>
</body>

</html>