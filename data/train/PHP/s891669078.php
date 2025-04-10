<?php

ini_set('display_errors', 1);
$ud = array();
$side = array();
$direction = array('R', 'L', 'D', 'U');
$cood = array(array(0, 1), array(0, -1), array(1, 0), array(-1, 0));
$ud[] = str_split(rtrim(fgets(STDIN)));
for ($i = 0; $i < 4; $i++) {
    $side[] = str_split(rtrim(fgets(STDIN)));
    $ud[] = str_split(rtrim(fgets(STDIN)));
}

$field = array_fill(0, 5, array_fill(0, 5, array_fill(0, 4, 0)));
for ($i = 0; $i < 5; $i++) {
    for ($j = 0; $j < 5; $j++) {
        if (isset($side[$i - 1][$j]) && $side[$i - 1][$j] === '1') {
            $field[$i][$j][0] = 3;
        } elseif (isset($ud[$i][$j]) && $ud[$i][$j] === '1') {
            $field[$i][$j][0] = 0;
        } elseif (isset($side[$i][$j]) && $side[$i][$j] === '1') {
                $field[$i][$j][0] = 2;
        } else {
            $field[$i][$j][0] = 1;
        }
        if (isset($side[$i][$j]) && $side[$i][$j] === '1') {
            $field[$i][$j][1] = 2;
        } elseif (isset($ud[$i][$j - 1]) && $ud[$i][$j - 1] === '1') {
            $field[$i][$j][1] = 1;
        } elseif (isset($side[$i - 1][$j]) && $side[$i - 1][$j] === '1') {
                $field[$i][$j][1] = 3;
        } else {
            $field[$i][$j][1] = 0;
        }
        if (isset($ud[$i][$j]) && $ud[$i][$j] === '1') {
            $field[$i][$j][2] = 0;
        } elseif (isset($side[$i][$j]) && $side[$i][$j] === '1') {
            $field[$i][$j][2] = 2;
        } elseif (isset($ud[$i][$j - 1]) && $ud[$i][$j - 1] === '1') {
            $field[$i][$j][2] = 1;
        } else {
            $field[$i][$j][2] = 3;
        }
        if (isset($ud[$i][$j - 1]) && $ud[$i][$j - 1] === '1') {
            $field[$i][$j][3] = 1;
        } elseif (isset($side[$i - 1][$j]) && $side[$i - 1][$j] === '1') {
            $field[$i][$j][3] = 3;
        } elseif (isset($ud[$i][$j]) && $ud[$i][$j] === '1') {
            $field[$i][$j][3] = 0;
        } else {
            $field[$i][$j][3] = 2;
        }
    }
}

$p = array(0, 0);
$d = 0;
$trace = array();
while (true) {
    $trace[] = $direction[$d];
    $p[0] += $cood[$d][0];
    $p[1] += $cood[$d][1];
    $d = $field[$p[0]][$p[1]][$d];
    if ($p[0] === 0 && $p[1] === 0) {
        break;
    }
}

echo implode('', $trace);
echo PHP_EOL;