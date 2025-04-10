<?php

fscanf(STDIN, '%d', $n);
for ($count = 0; $count < $n; $count++) {
    fscanf(STDIN, '%f %f %f %f %f %f', $x1, $y1, $x2, $y2, $x3, $y3);
    $a = sqrt(($x1 - $x2) * ($x1 - $x2) + ($y1 - $y2) * ($y1 - $y2));
    $b = sqrt(($x3 - $x2) * ($x3 - $x2) + ($y3 - $y2) * ($y3 - $y2));
    $c = sqrt(($x1 - $x3) * ($x1 - $x3) + ($y1 - $y3) * ($y1 - $y3));
    $R = $a * $b * $c / sqrt(($a + $b + $c) * (- $a + $b + $c) * ($a - $b + $c) * ($a + $b - $c));
    $s = array();
    $s[] = $x2 - $x1;
    $s[] = $y2 - $y1;
    $s[] = ($x2 * $x2 - $x1 * $x1 + $y2 * $y2 - $y1 * $y1) / 2;
    $t = array();
    $t[] = $x3 - $x1;
    $t[] = $y3 - $y1;
    $t[] = ($x3 * $x3 - $x1 * $x1 + $y3 * $y3 - $y1 * $y1) / 2;

    if ($s[0] === 0.0) {
        $tmp = $s;
        $s = $t;
        $t = $tmp;
    }
    $div = $s[0];
    for ($i = 0; $i < 3; $i++) {
        $s[$i] /= $div;
    }
    $times = $t[0];
    for ($i = 0; $i < 3; $i++) {
        $t[$i] -= $s[$i] * $times;
    }
    $div = $t[1];
    for ($i = 0; $i < 3; $i++) {
        $t[$i] /= $div;
    }
    $times = $s[1];
    for ($i = 0; $i < 3; $i++) {
        $s[$i] -= $t[$i] * $times;
    }
    echo sprintf('%.3f %.3f %.3f', round($s[2], 3), round($t[2], 3), round($R, 3));
    echo PHP_EOL;
}