<?php
class Training_days
{
    public $name;
    public $exercises;

    public function __construct(string $name, array $exercises)
    {
        $this->name = $name;
        $this->exercises = $exercises;
    }
    public function getName()
    {
        return $this->name;
    }
    public function getExercises()
    {
        return $this->exercises;
    }
}
