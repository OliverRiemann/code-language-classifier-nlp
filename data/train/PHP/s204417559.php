<?php

$format = array(
    '%d %s %d %s %d %s %d',
    '(%d %s %d %s %d) %s %d',
    '((%d %s %d) %s %d) %s %d',
    '(%d %s (%d %s %d)) %s %d',
    '%d %s (%d %s %d %s %d)',
    '%d %s ((%d %s %d) %s %d)',
    '%d %s (%d %s (%d %s %d))',
    '(%d %s %d) %s %d %s %d',
    '%d %s (%d %s %d) %s %d',
    '%d %s %d %s (%d %s %d)',
    '(%d %s %d) %s (%d %s %d)'
);

while (($line = trim(fgets(STDIN))) !== '0 0 0 0') {
    sscanf($line, '%d %d %d %d', $a, $b, $c, $d);
    $group = getGroup($a, $b, $c, $d);
    $result = 0;
    foreach ($format as $f) {
        foreach ($group as $g) {
            $ptn = getPattern($f, $g);
            foreach ($ptn as $str) {
                eval("\$n = $str;");
                if ($n === 10) {
                    $result = $str;
                    break 3;
                }
            }
        }
    }

    echo $result, PHP_EOL;
}

function getGroup($a, $b, $c, $d)
{
    $arr = array($a, $b, $c, $d);
    $group = array();
    $check = array();
    for ($i = 0; $i < 4; $i++) {
        for ($j = 0; $j < 4; $j++) {
            if ($i === $j) {
                continue;
            }
            for ($k = 0; $k < 4; $k++) {
                if ($i === $k || $j === $k) {
                    continue;
                }
                $l = 6 - $i - $j - $k;
                $arr2 = array($arr[$i], $arr[$j], $arr[$k], $arr[$l]);
                $str = implode(',', $arr2);
                if (!in_array($str, $check)) {
                    $check[] = $str;
                    $group[] = $arr2;
                }
            }
        }
    }

    return $group;
}

function getPattern($format, $group)
{
    $ptn = array();
    $arr = explode(',', '+,-,*');
    list($a, $b, $c, $d) = $group;
    for ($i = 0; $i < 3; $i++) {
        for ($j = 0; $j < 3; $j++) {
            for ($k = 0; $k < 3; $k++) {
                $ptn[] = sprintf($format, $a, $arr[$i], $b, $arr[$j], $c, $arr[$k], $d);
            }
        }
    }
    return $ptn;
}