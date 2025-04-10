<?php

$vectors = [[1, 0], [0, -1], [-1, 0], [0, 1]];

function solve() {
    $mp = [];
    for ($i = 0; $i < 12; $i++) {
        $mp[$i] = trim(fgets(STDIN));
        //echo $mp[$i] . "\n";
        //echo $mp[$i][10] . "\n";
    }
    $visited = array_fill(0, 12, array_fill(0, 12, false));
    $cnt = 0;
    for ($y = 0; $y < 12; $y++) {
        for ($x = 0; $x < 12; $x++) {
            if (!$visited[$y][$x] and $mp[$y][$x] === "1") {
                $cnt++;
                $visited[$y][$x] = true;
                search($x, $y, $mp, $visited);
            }
        }
    }
    return [$cnt, fgets(STDIN)];
}

function search($x, $y, &$mp, &$visited) {
    global $vectors;
    foreach ($vectors as $vector) {
        list($dx, $dy) = $vector;
        $nx = $x + $dx;
        $ny = $y + $dy;
        if ((0 <= $nx and $nx < 12 and 0 <= $ny and $ny < 12) and ($mp[$ny][$nx] === "1" and !$visited[$ny][$nx])) {
            $visited[$ny][$nx] = true;
            search($nx, $ny, $mp, $visited);
        }
    }
}

while (true) {
    list($cnt, $ok) = solve();
    echo $cnt . "\n";
    if (!$ok) {
        break;
    }
}
