<?php

$field = array();
for ($i = 0; $i < 10; $i++) {
    $field[] = array();
    for ($j = 0; $j < 10; $j++) {
        $field[$i][] = 0;
    }
}

$dx = array(
    array(1, -1, 0, 0),
    array(1, 1, -1, -1),
    array(2, -2, 0, 0),
);
$dy = array(
    array(0, 0, 1, -1),
    array(1, -1, 1, -1),
    array(0, 0, 2, -2),
);

while (TRUE) {
    fscanf(STDIN, '%d,%d,%d', $x, $y, $size);
    if (feof(STDIN)) {
        break;
    }
    drop($x, $y, $size);
}

$max = 0;
$c = 0;
for ($i = 0; $i < 10; $i++) {
    for ($j = 0; $j < 10; $j++) {
        if ($field[$i][$j] > $max) {
            $max = $field[$i][$j];
        } elseif ($field[$i][$j] === 0) {
            $c++;
        }
    }
}

echo $c . PHP_EOL;
echo $max . PHP_EOL;

function drop($x, $y, $size) {
    global $field, $dx, $dy;
    $field[$y][$x]++;
    for ($i = 0; $i < $size; $i++) {
        for($j = 0; $j < 4; $j++) {
            $nx = $x + $dx[$i][$j];
            $ny = $y + $dy[$i][$j];
            if (isset($field[$ny][$nx])) {
                $field[$ny][$nx]++;
            }
        }
    }
}