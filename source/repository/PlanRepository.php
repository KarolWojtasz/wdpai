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

    public function getPlans()
    {


        $result  = pg_query($this->connection, "SELECT plans.name AS plans_name, training_days.name AS training_day_name,
                    exercises.name AS exercise_name, plan_exercises.sets, plan_exercises.reps
            FROM plans
            INNER JOIN training_days ON training_days.plan_id = plans.id
            INNER JOIN plan_exercises ON plan_exercises.training_day_id = training_days.id
            INNER JOIN exercises ON exercises.id = plan_exercises.exercise_id
            WHERE plans.user_id = '" . $_SESSION["user_id"] . "'
        ");
        $names = [];
        $plans = array();
        $num = 0;
        $allExercises = [];
        while ($row = pg_fetch_assoc($result)) {
            if (!in_array($row['plans_name'], $names)) {
                $allExercises[$num] = new Plan($row['plans_name'], []);
                //array_push($allExercises[$num]->$trainingDays, new Training_days($row['training_days_name'], []));

                $plans[$num]["name"] = $row['plans_name'];
                $num += 1;
            }
            //array_push($allExercises, new Exercise_plan($row['plans_name'], intval($row['sets']), intval($row['reps'])));
        }

        return $allExercises;
    }
}
