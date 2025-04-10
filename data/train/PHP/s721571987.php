<?php

$alphabet = range('a', 'z');
//26と互いに素
$arr = array(1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25);
fscanf(STDIN, '%d', $n);
for ($i = 0; $i < $n; $i++) {
    $str = trim(fgets(STDIN));
    foreach ($arr as $a) {
        for ($b = 0; $b < 26; $b++) {
            //変換用配列
            $encode = array();
            foreach ($alphabet as $m => $ch) {
                $encode[$ch] = $alphabet[($a * $m + $b) % 26];
            }

            $word1 = $encode['t'] . $encode['h'] . $encode['i'] . $encode['s'];
            $word2 = $encode['t'] . $encode['h'] . $encode['a'] . $encode['t'];
            $format = "/\b({$word1}|{$word2})\b/";

            //this, thatを意味する暗号がある
            if (preg_match($format, $str)) {
                //キーと値を反転
                $decode = array_flip($encode);
                break 2;
            }
        }
    }

    for ($j = 0, $len = strlen($str); $j < $len; $j++) {
        $ch = $str[$j];
        echo ctype_alpha($ch) ? $decode[$ch] : $ch;
    }
    echo PHP_EOL;
}