<?php
while (true) {
    $line = trim(fgets(STDIN));
    list($H, $W) = explode(' ', $line);
    if ($W == 0 && $H == 0) {
        break;
    }
    $room = array();
    for ($i = 0; $i < $H; $i++) {
        $room[$i] = trim(fgets(STDIN));
    }
    $visited = array();
    for ($i = 0; $i < $H; $i++) {
        for ($j = 0; $j < $W; $j++) {
            $visited[$i][$j] = false;
        }
    }
    $x = 0; $y = 0;
    $isLoop = false;
    while (true) {
        $line = $room[$y];
        $dir = $line[$x];
        if ($dir == '.') {
            break;
        }
        $visited[$y][$x] = true;
        switch ($dir) {
            case '>':
                $x++;
                break;
            case '<':
                $x--;
                break;
            case 'v':
                $y++;
                break;
            case '^':
                $y--;
                break;
        }
        if ($visited[$y][$x]) {
            $isLoop = true;
            break;
        }
    }
    if ($isLoop) {
        echo "LOOP\n";
    } else {
        echo "$x $y\n"; 
    }
}

 