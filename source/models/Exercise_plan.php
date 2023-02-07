<?php
class Exercise_plan
{
    public $name;
    public $sets;
    public $reps;

    public function __construct(string $name, int $sets, int $reps)
    {
        $this->name = $name;
        $this->sets = $sets;
        $this->reps = $reps;
    }
    public function getName()
    {
        return $this->name;
    }
    public function getSets()
    {
        return $this->sets;
    }

    public function getReps()
    {
        return $this->reps;
    }
}
