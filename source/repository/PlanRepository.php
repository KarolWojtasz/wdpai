<?php

require_once 'Repository.php';
require_once __DIR__ . '/../models/Exercise_plan.php';
require_once __DIR__ . '/../models/Plan.php';
require_once __DIR__ . '/../models/Training_days.php';

class PlanRepository extends Repository
{

    public function insertPlan(string $json)
    {
        $decoded = json_decode($json, true);

        $result  = pg_query($this->connection, "INSERT INTO plans (user_id, name)
        VALUES ('" . $_SESSION["user_id"] . "','" . $decoded["body"]["name"] . "') 
        RETURNING id");
        $row = pg_fetch_all($result);
        foreach ($decoded["body"]["trainingDays"] as $day) {
            $dayId  = pg_query($this->connection, "INSERT INTO training_days (plan_id, name)
            VALUES ('" . $row[0]["id"] . "','" . $day["name"] . "') 
            RETURNING id");
            $dayId = pg_fetch_all($dayId);
            foreach ($day["exercises"] as $exercise) {
                $exerciseID  = pg_query($this->connection, "INSERT INTO plan_exercises (training_day_id, exercise_id,sets,reps)
                VALUES ('" . $dayId[0]["id"] . "',(select id from exercises where name = '" . $exercise["name"] . "'),'" . $exercise["sets"] . "','" . $exercise["reps"] . "'
                ) 
                RETURNING id");
            }
        }
        if (!$row) {
            return false;
        } else
            return true;
    }

    public function insertTraining(string $json)
    {

        $decoded = json_decode($json, true);

        $result  = pg_query($this->connection, "SELECT training_days.name AS training_day_name,
        exercises.name AS exercise_name, plan_exercises.sets, plan_exercises.reps,plan_exercises.id
        FROM plans
        INNER JOIN training_days ON training_days.plan_id = plans.id
        INNER JOIN plan_exercises ON plan_exercises.training_day_id = training_days.id
        INNER JOIN exercises ON exercises.id = plan_exercises.exercise_id
        WHERE plans.user_id = '" . $_SESSION["user_id"] . "' and plans.name = '" . $decoded["body"]["planName"] . "' and training_days.name = '" . $decoded["body"]["dayName"] . "'
        ORDER BY training_day_name");
        $exercisesID = [];

        while ($row = pg_fetch_assoc($result)) {
            array_push($exercisesID, $row["id"] . ";" . $row["exercise_name"]);
        }
        try {
            foreach ($decoded["body"]["exercises"] as $exercise) {

                foreach ($exercise["reps"] as $set) {
                    $id = "0";


                    foreach ($exercisesID as $string) {

                        if ($exercise["name"] == explode(";", $string)[1]) {
                            $id = explode(";", $string)[0];
                        }
                    }

                    $result  = pg_query($this->connection, "INSERT INTO workout_sessions (plan_exercise_id, timestamp, reps, weight) 
                    VALUES ('" . $id . "',current_timestamp,'" . explode(";", $set)[0] . "','" . explode(";", $set)[1] . "')");
                }
            }
            return true;
        } catch (Exception $e) {
            return false;
        }
    }


    public function getPlans()
    {


        $result  = pg_query($this->connection, "SELECT plans.name AS plans_name, training_days.name AS training_day_name,
                    exercises.name AS exercise_name, plan_exercises.sets, plan_exercises.reps
            FROM plans
            INNER JOIN training_days ON training_days.plan_id = plans.id
            INNER JOIN plan_exercises ON plan_exercises.training_day_id = training_days.id
            INNER JOIN exercises ON exercises.id = plan_exercises.exercise_id
            WHERE plans.user_id = '" . $_SESSION["user_id"] . "'
            ORDER BY plans_name, training_day_name
        ");

        $resultArray = [];

        while ($row = pg_fetch_assoc($result)) {
            if (!isset($resultArray[$row["plans_name"]])) {
                $resultArray[$row["plans_name"]] = [];
            }
            if (!isset($resultArray[$row["plans_name"]][$row["training_day_name"]])) {
                $resultArray[$row["plans_name"]][$row["training_day_name"]] = [];
            }
            array_push($resultArray[$row["plans_name"]][$row["training_day_name"]], $row["exercise_name"] . ";" . $row["sets"] . ";" . $row["reps"]);
        }

        return $resultArray;
    }
}
