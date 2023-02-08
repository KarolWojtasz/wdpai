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
        <label>Type name of training:<input id="trainingName" type="text" /></label>
        <div id="trainingContainer">


        </div>

        <div id="buttonsContainer">
            <button id="addDay">+ Add next training day</button>
            <button id="savePlan">Save workout plan</button>


        </div>
    </div>
</body>

</html>