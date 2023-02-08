<?php
require_once 'AppController.php';
require_once __DIR__ . '/../repository/PlanRepository.php';
class PlanController extends AppController
{

    public function savePlan()
    {
        $contentType = isset($_SERVER["CONTENT_TYPE"]) ? trim($_SERVER["CONTENT_TYPE"]) : '';
        if ($contentType == "application/json") {
            $body = trim(file_get_contents("php://input"));

            $planRepository = new PlanRepository();

            $result = $planRepository->insertPlan($body);

            header('Content-type: application/json');
            http_response_code(200);
            echo json_encode(array("body" =>  $result));
        }
    }
    public function plans()
    {
        if ($_SESSION["user_id"] == null) {
            $url = "http://$_SERVER[HTTP_HOST]";
            header("Location: {$url}/login");
        }

        $plans = $this->getPlans();
        $this->render("plans", ["plans" => $plans]);
    }
    public function getPlans()
    {
        $planRepository = new PlanRepository();

        $result = $planRepository->getPlans();
        return $result;
    }

    public function training()
    {
        if ($_SESSION["user_id"] == null) {
            $url = "http://$_SERVER[HTTP_HOST]";
            header("Location: {$url}/login");
        }
        $plans = $this->getPlans();
        $this->render("training", ["plans" => $plans]);
    }
    public function saveTraining()
    {
        $contentType = isset($_SERVER["CONTENT_TYPE"]) ? trim($_SERVER["CONTENT_TYPE"]) : '';
        if ($contentType == "application/json") {
            $body = trim(file_get_contents("php://input"));

            $planRepository = new PlanRepository();

            $result = $planRepository->insertTraining($body);

            header('Content-type: application/json');
            http_response_code(200);
            echo json_encode(array("body" =>  $result));
        }
    }
}
