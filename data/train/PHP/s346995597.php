<?php

fscanf(STDIN, "%d", $w);
$g = new G();
$a = array();
for ($i = 0; $i < $w; $i++) {
    $a[$i + 1] = 0;
    $g->lines[$i + 1] = new Line($i + 1);
}


fscanf(STDIN, "%d", $n);
$bars = array();
for ($i = 0; $i < $n; $i++) {
    fscanf(STDIN, "%s", $bar);
    $bar = explode(',', $bar);

    $line = $g->getLine((int) $bar[0]);
    $line->edges[$i] = $bar[1];

    $line = $g->getLine((int) $bar[1]);
    $line->edges[$i] = $bar[0];
}

for ($i = 1; $i <= $w; $i++) {
    $l = $i;
    $t = 0;
    while (TRUE) {
        $line = $g->getLine($l);
        $next = $line->nextLine($t);
        if ($next === NULL) {
            $a[$l] = $i;
            break;
        }
        $t = $next[0] + 1;
        $l = $next[1];
    }
}

foreach ($a as $v) {
    echo (string) $v;
    echo PHP_EOL;
}

class Line
{
    public $index;
    public $edges = array();

    public function __construct($index) {
        $this->index = $index;
    }

    public function nextLine($t) {
        foreach ($this->edges as $key => $value) {
            if ($key >= $t) {
                return array($key, $value);
            }
        }
        return NULL;
    }
}

class G
{
    public $lines = array();

    public function getLine($index) {
        return $this->lines[$index];
    }
}