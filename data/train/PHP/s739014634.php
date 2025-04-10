<?php
while((list($h, $w) = explode(" ", trim(fgets(STDIN)))) && $h && $w) {
    $field = array();
    for($i = 0; $i < $h; $i++) {
        foreach(str_split(trim(fgets(STDIN))) as $dir) {
            $field[$i][] = new Tile($dir);
        }
    }
    $person = new Person(0, 0);
    $flg = false;
    while(($dir = $field[$person->getY()][$person->getX()]->getDir()) != null) {
        if($flg = $person->move($dir)) {
            break;
        }
    }
    echo $flg ? $person->showPos() : "LOOP", PHP_EOL;
}

class Tile {
    private $flg_;
    private $dir_;

    function __construct($dir) {
        $this->flg_ = false;
        $this->dir_ = $dir;
    }

    function getDir() {
        if($this->flg_) {
            return null;
        } else {
            $this->flg_ = true;
            return $this->dir_;
        }
    }
}

class Person {
    private $y_;
    private $x_;

    function __construct($y, $x) {
        $this->y_ = $y;
        $this->x_ = $x;
    }

    function move($dir) {
        switch($dir) {
          case "v":
            $this->y_++;
            return false;
          case "^":
            $this->y_--;
            return false;
          case ">":
            $this->x_++;
            return false;
          case "<":
            $this->x_--;
            return false;
          case ".":
            return true;
        }
    }

    function getY() {
        return $this->y_;
    }

    function getX() {
        return $this->x_;
    }

    function showPos() {
        echo $this->x_, " ", $this->y_;
    }
}