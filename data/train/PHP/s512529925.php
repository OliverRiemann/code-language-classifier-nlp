<?php

class Queue {
    private $arr = [];
    private $size = 0;
    
    public function push($item) {
        $this->size++;
        array_push($this->arr, $item);
    }
    
    public function pop() {
        $this->size--;
        return array_shift($this->arr);
    }
    
    public function isEmpty() {
        return $this->size === 0;
    }
}
while (true) {
    $s = trim(fgets(STDIN));
    if ($s === "0") {
        break;
    }
    search($s);
}

function search($s) {
    $length = strlen($s);
    $que = new Queue();
    $que->push([0, $s]);
    $dic = [];
    $r = "";
    $g = "";
    $b = "";
    for ($i = 0; $i < $length; $i++) {
        $r .= "r";
        $g .= "g";
        $b .= "b";
    }
    $singles = [$r, $g, $b];
    $ok = false;
    while (!$que->isEmpty()) {
        list($score, $state) = $que->pop();
        if (isSingleColor($state, $singles)) {
            echo $score . "\n";
            $ok = true;
            break;
        }
        for ($i = 0; $i < $length - 1; $i++) {
            $c1 = $state[$i];
            $c2 = $state[$i + 1];
            if ($c1 != $c2) {
                $c3 = other($c1, $c2);
                $newState = substr_replace($state, $c3, $i, 2);
                if (!array_key_exists($newState, $dic)) {
                    $dic[$newState] = $score + 1;
                    $que->push([$score + 1, $newState]);
                }
            }
        }
    }
    if (!$ok) {
        echo "NA\n";
    }
}



function isSingleColor($s, $singles) {
    foreach ($singles as $single) {
        if ($s === $single) {
            return true;
        }
    }
    return false;
}

function other($c1, $c2) {
    if ($c1 === "r") {
        if ($c2 === "g") {
            return "bb";
        } elseif ($c2 === "b") {
            return "gg";
        }
    } elseif ($c1 === "g") {
        if ($c2 === "r") {
            return "bb";
        } elseif ($c2 === "b") {
            return "rr";
        }
    } elseif ($c1 === "b") {
        if ($c2 === "r") {
            return "gg";
        } elseif ($c2 === "g") {
            return "rr";
        }
    }
}
