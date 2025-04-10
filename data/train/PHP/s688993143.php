<?php

$mp = array_fill(0, 10, array_fill(0, 10, 0));
$updateRange = [];
$updateRange[1] = [[1, 0], [0, -1], [0, 0], [0, 1], [-1, 0]];
$updateRange[2] = [[1, -1], [1, 0], [1, 1], [0, -1], [0, 0], [0, 1], [-1, -1], [-1, 0], [-1, 1]];
$updateRange[3] = [[2, 0], [1, -1], [1, 0], [1, 1], [0, -2], [0, -1], [0, 0], [0, 1], [0, 2], [-1, -1], [-1, 0], [-1, 1], [-2, 0]];

function drop($x, $y, $size) {
    global $updateRange;
    foreach ($updateRange[$size] as $point) {
        list($dx, $dy) = $point;
        $nx = $x + $dx;
        $ny = $y + $dy;
        update($nx, $ny);
    }
}

function update($nx, $ny) {
    global $mp;
    if ((0 <= $nx) and ($nx < 10) and (0 <= $ny) and ($ny < 10)) {
        $mp[$ny][$nx]++;
    }
}

while (fscanf(STDIN, "%d,%d,%d", $x, $y, $s)) {
    drop($x, $y, $s, $updateRange, $mp);
}

$cnt = 0;
$score = 0;
for ($y = 0; $y < 10; $y++) {
    for ($x  = 0; $x < 10; $x++) {
        if ($mp[$y][$x] == 0) {
            $cnt++;
        }
        if ($mp[$y][$x] > $score) {
            $score = $mp[$y][$x];
        }
    }
}
echo $cnt . "\n";
echo $score . "\n";

