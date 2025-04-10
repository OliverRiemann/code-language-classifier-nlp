<?php

fscanf(STDIN, '%d', $n);
$coprime = array();
for ($i = 1; $i < 26; $i++) {
    if (gcd($i, 26) === 1) {
        $coprime[] = $i;
    }
}
for ($i = 0; $i < $n; $i++) {
    $s = explode(' ', rtrim(fgets(STDIN)));
    $f = false;
    foreach ($coprime as $a) {
        for ($b = 0; $b < 26; $b++) {
            $tmp = $s;
            foreach ($s as $k => $w) {
                $s[$k] = dec($w, $a, $b);
                if ($s[$k] === 'that' || $s[$k] === 'this') {
                    $f = true;
                }
            }
            if ($f) {
                break 2;
            }
            $s = $tmp;
        }
    }

    echo implode(' ', $s) . PHP_EOL;
}

function gcd($a, $b) {
    if ($a === $b) {
        return $a;
    }
    return $a > $b ? gcd($a - $b, $b) : gcd($a, $b - $a);
}

function dec($w, $a, $b) {
    $w = str_split($w);
    for ($i = 0; $i < count($w); $i++) {
        $asc = ord($w[$i]) - ord('a');
        $w[$i] = chr(ord('a') + ($a * $asc + $b) % 26);
    }
    return implode('', $w);
}