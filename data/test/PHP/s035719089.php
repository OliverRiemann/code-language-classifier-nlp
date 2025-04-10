<?php

$map = array_fill(0, 10, array_fill(0, 10, 0));
while (($line = trim(fgets(STDIN))) !== '') {
    sscanf($line, '%d,%d,%d', $x, $y, $size);
    //1は別処理
    if ($size === 1) {
        isset($map[$y - 1]) && $map[$y - 1][$x]++;
        isset($map[$y + 1]) && $map[$y + 1][$x]++;
        isset($map[$y][$x - 1]) && $map[$y][$x - 1]++;
        isset($map[$y][$x + 1]) && $map[$y][$x + 1]++;
        $map[$y][$x]++;
        continue;
    }

    //3だけが有する部分
    if ($size === 3) {
        isset($map[$y - 2]) && $map[$y - 2][$x]++;
        isset($map[$y + 2]) && $map[$y + 2][$x]++;
        isset($map[$y][$x - 2]) && $map[$y][$x - 2]++;
        isset($map[$y][$x + 2]) && $map[$y][$x + 2]++;
    }

    //2と3の共通部分
    for ($y2 = $y - 1; $y2 <= $y + 1; $y2++) {
        if ($y2 < 0 || $y2 > 9) {
            continue;
        }
        for ($x2 = $x - 1; $x2 <= $x + 1; $x2++) {
            if ($x2 >= 0 && $x2 < 10) {
                $map[$y2][$x2]++;
            }
        }
    }
}

$cnt = 0;
$max = 0;
for ($y = 0; $y < 10; $y++) {
    for ($x = 0; $x < 10; $x++) {
        $n = $map[$y][$x];
        $max = max($max, $n);
        !$n && $cnt++;
    }
}

printf("%d\n%d\n", $cnt, $max);