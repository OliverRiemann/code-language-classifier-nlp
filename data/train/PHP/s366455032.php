<?php

while (($line = trim(fgets(STDIN))) !== '0 0') {
    sscanf($line, '%d %d', $H, $W);
    $map = new SplFixedArray($H);
    $visited = array();
    for ($i = 0; $i < $H; $i++) {
        $map[$i] = new SplFixedArray($W);
        $line = trim(fgets(STDIN));
        foreach (str_split($line) as $j => $ch) {
            $map[$i][$j] = $ch;
        }
    }

    $p = '0 0';
    $result = 'LOOP';
    while (!in_array($p, $visited)) {
        sscanf($p, '%d %d', $x, $y);
        $visited[] = $p;
        switch ($map[$y][$x]) {
            case '>':
                $p = sprintf('%d %d', $x + 1, $y);
                break;

            case '<':
                $p = sprintf('%d %d', $x - 1, $y);
                break;

            case '^':
                $p = sprintf('%d %d', $x, $y - 1);
                break;

            case 'v':
                $p = sprintf('%d %d', $x, $y + 1);
                break;

            default:
                $result = $p;
                break 2;
        }
    }

    echo $result, PHP_EOL;
}