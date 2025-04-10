<?php

while (true) {
    $map = array();
    for ($i = 0; $i < 8; $i++) {
        $line = trim(fgets(STDIN));
        if ($line === '') {
            break 2;
        }
        $map[$i] = str_split($line);
    }

    foreach ($map as $y => $arr) {
        foreach ($arr as $x => $n) {
            if ($n !== '1') {
                continue;
            }
            echo search($map, $x, $y), PHP_EOL;
            break 2;
        }
    }
    //空行を取り除く
    fgets(STDIN);
}

//最初に見つけた点から調べる
function search($map, $x, $y)
{
    $right = isset($map[$y][$x + 1]) && $map[$y][$x + 1] === '1';
    $bottomRight = isset($map[$y + 1][$x + 1]) && $map[$y + 1][$x + 1] === '1';
    $bottom = isset($map[$y + 1][$x]) && $map[$y + 1][$x] === '1';
    $bottomLeft = isset($map[$y + 1][$x - 1]) && $map[$y + 1][$x - 1] === '1';

    //右、右下、下に点が存在するのはA
    if ($right && $bottomRight && $bottom) {
        return 'A';

    //右、右下に点が存在するのはE
    } elseif ($right && $bottomRight) {
        return 'E';

    //右、下に点が存在するのはG
    } elseif ($right && $bottom) {
        return 'G';

    //右下、下に点が存在するのはF
    } elseif ($bottomRight && $bottom) {
        return 'F';

    //右に点が存在するのはC
    } elseif ($right) {
        return 'C';

    //左下に点が存在するのはD
    } elseif ($bottomLeft) {
        return 'D';

    //残りはB
    } else {
        return 'B';
    }
}