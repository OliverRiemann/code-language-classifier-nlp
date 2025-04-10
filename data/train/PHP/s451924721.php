<?php

while (($line = trim(fgets(STDIN))) !== '0') {
    $n = (int)$line;
    //0埋め
    $arr = array_fill(0, $n, array_fill(0, $n, 0));
    $x = (int)($n / 2);
    $y = $x + 1;
    //最初の入力
    $arr[$y][$x] = 1;
    $m = pow($n, 2);
    $cnt = 2;
    $right = true;

    //全ての入力が終わるまで
    while ($cnt <= $m) {
        //右下モード
        if ($right) {
            $x = $x + 1 < $n ? $x + 1 : 0;
            $y = $y + 1 < $n ? $y + 1 : 0;
            //既に入力済み
            if ($arr[$y][$x]) {
                //左下モード
                $right = false;
            } else {
                $arr[$y][$x] = $cnt;
                //右下モードにして次の数字
                $right = true;
                $cnt++;
            }
        //左下モード
        } else {
            $x = $x - 1 < 0 ? $n - 1 : $x - 1;
            $y = $y + 1 < $n ? $y + 1 : 0;
            //既に入力済み
            if ($arr[$y][$x]) {
                continue;
            }
            $arr[$y][$x] = $cnt;
            //右下モードにして次の数字
            $right = true;
            $cnt++;
        }
    }

    for ($y = 0; $y < $n; $y++) {
        for ($x = 0; $x < $n; $x++) {
            printf('%4s', $arr[$y][$x]);
        }
        echo PHP_EOL;
    }
}