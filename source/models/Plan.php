<?php
class Plan
{
    public $name;
    public $trainingDays;

    public function __construct(string $name, array $trainingDays)
    {
        $this->name = $name;
        $this->trainingDays = $trainingDays;
    }
    public function getName()
    {
        return $this->name;
    }
    public function getExercises()
    {
        return $this->trainingDays;
    }
}
