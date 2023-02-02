<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create workout - Liftology</title>
    <link rel="stylesheet" type="text/css" href="public/css/global.css">
    <link rel="stylesheet" type="text/css" href="public/css/create.css">
    <script defer type="text/javascript" src="public/script/create.js"></script>
</head>

<body>
    <?php include("nav.php"); ?>
    <div id="container">

        <h2>Create workout plan</h2>
        <div id="trainingContainer">
            <section class="readyDay">
                <input type="text" name="dayTitle">
                <div class="row">
                    <img src="" />
                    <select></select>
                    <input type="number" name="sets">
                    <input type="number" name="reps">

                </div>
                <button name="addExercise">+ Add next exercise</button>
                <button name="saveTrainingDay">Save Training Day</button>
            </section>

        </div>
        <div id="buttonsContainer">
            <button id="addDay">+ Add next training day</button>
            <form>
                <input type="submit" value="Save workout plan">
            </form>
        </div>
    </div>
</body>

</html>