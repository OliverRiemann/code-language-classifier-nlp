<?php

fscanf(STDIN, '%d', $N);
for ($i = 0; $i < $N; $i++) {
    fscanf(STDIN, '%s', $a);
    fscanf(STDIN, '%s', $b);
    //どちらかが80桁以上
    if (max(strlen($a), strlen($b)) > 80) {
        echo "overflow\n";
        continue;
    }

    //81桁の0埋め整数
    $arr = array_fill(0, 81, 0);
    $a = sprintf('%081s', $a);
    $b = sprintf('%081s', $b);
    //後方からなめていく
    for ($j = 80; $j > 0; $j--) {
        //arrには桁上りで1が入っている可能性があるので加算
        $n = $arr[$j] + $a[$j] + $b[$j];
        //桁上りする
        if ($n >= 10) {
            //1桁の値をarrに
            $arr[$j] = substr($n, 1);
            //一つ前の値を1にする
            $arr[$j - 1] += 1;
        } else {
            $arr[$j] = $n;
        }
    }

    //先頭から0が続いている場合は消す
    $result = preg_replace('/^0+(\d+)$/', '$1', implode('', $arr));
    if (strlen($result) > 80) {
        echo "overflow\n";
    } else {
        echo $result, PHP_EOL;
    }
}