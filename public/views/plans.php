<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liftology - My plans</title>
    <link rel="stylesheet" type="text/css" href="public/css/global.css">
    <link rel="stylesheet" type="text/css" href="public/css/create.css">
    <link rel="stylesheet" type="text/css" href="public/css/plans.css">
</head>

<body>
    <?php include("nav.php"); ?>
    <div id="container">
        <h2>My plans:</h2>
        <div id="trainingContainer">
            <?php foreach ($plans as $planName => $trainingDays) : ?>
                <h4><?php echo $planName; ?></h4>
                <?php foreach ($trainingDays as $trainingDayName => $exercises) : ?>

                    <section class="readyDay">
                        <input type="text" value="<?php echo $trainingDayName; ?>" placeholder="Training day title..." class="dayTitle" readonly="">
                        <div class="row">
                            <div></div>
                            <div></div>
                            <div>Sets</div>
                            <div>Reps</div>
                        </div>
                        <?php foreach ($exercises as $exercise) : ?>
                            <div class="row">
                                <img src="./public/img/exercises/3/4 Sit-Up">
                                <select id="selectExercise" disabled="disabled">
                                    <option><?php echo explode(";", $exercise)[0]; ?></option>
                                </select>
                                <input disabled="disabled" value="<?php echo intval(explode(";", $exercise)[1]); ?>" type="number" name="sets">
                                <input disabled="disabled" value="<?php echo intval(explode(";", $exercise)[2]); ?>" type="number" name="reps">
                            </div>
                        <?php endforeach; ?>
                    </section>
                <?php endforeach; ?>

            <?php endforeach; ?>
        </div>
        <a href="/create">Create new plan</a>
    </div>
</body>

</html>