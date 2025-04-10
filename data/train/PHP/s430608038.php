<?php

while (TRUE) {
    $c = fscanf(STDIN, '%d,%d,%d,%d,%d');
    if (feof(STDIN)) {
        break;
    }
    sort($c);
    $hash = array();
    $max = 0;
    foreach ($c as $v) {
        if (!isset($hash[$v])) {
            $hash[$v] = 0;
        }
        $hash[$v]++;
        $max = $hash[$v] > $max ? $hash[$v] : $max;
    }
    arsort($hash);
    $combo = 'null';
    if ($max >= 2) {
        $combo = 'one pair';
    }
    if ($max >= 2 && count($hash) <= 3) {
        $combo = 'two pair';
    }
    if ($max >= 3) {
        $combo = 'three card';
    }
    if (count($hash) === 5 && isStraight($c)) {
        $combo = 'straight';
    }
    if ($max >= 3 && count($hash) <= 2) {
        $combo = 'full house';
    }
    if ($max >= 4) {
        $combo = 'four card';
    }
    echo $combo . PHP_EOL;
}

function isStraight($cards) {
    if (max($cards) - min($cards) === 4) {
        return true;
    }
    if ($cards[0] === 1 && $cards[1] === 10 && $cards[4] === 13) {
        return true;
    }
    return false;
}