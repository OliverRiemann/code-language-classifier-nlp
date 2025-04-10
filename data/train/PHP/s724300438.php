<?php

while (true) {
    fscanf(STDIN, '%s', $nums);
    if (feof(STDIN)) {
        break;
    }
    $nums = str_split($nums);
    for ($i = 0; $i < 13; $i++) {
        $nums[$i] = (int) $nums[$i];
    }
    $result = array();
    for ($i = 1; $i <= 9; $i++) {
        $a = $nums;
        $a[] = $i;
        sort($a);
        $hash = array();
        foreach ($a as $v) {
            if (!isset($hash[$v])) {
                $hash[$v] = 0;
            }
            $hash[$v]++;
        }
        if ($hash[$i] > 4) {
            continue;
        }
        $stack = array(array($hash, false));
        while (count($stack)) {
            $node = array_pop($stack);
            $h = update($node[0]);
            $f = $node[1];
            if (count($h) === 0) {
                $result[] = $i;
                break;
            }
            $keys = array_keys($h);
            if (!$f && $h[$keys[0]] >= 2) {
                $t = $h;
                $t[$keys[0]] -= 2;
                $stack[] = array($t, true);
            }
            if ($h[$keys[0]] >= 3) {
                $t = $h;
                $t[$keys[0]] -= 3;
                $stack[] = array($t, $f);
            }
            if (isset($keys[2]) && $keys[2] - $keys[0] === 2) {
                for ($j = 0; $j < 3; $j++) {
                    $h[$keys[$j]]--;
                }
                $stack[] = array($h, $f);
            }
        }
    }
    echo count($result) > 0 ? implode(' ', $result) : 0;
    echo PHP_EOL;
}

function update($nums) {
    foreach ($nums as $k => $v) {
        if ($v === 0) {
            unset($nums[$k]);
        }
    }
    return $nums;
}