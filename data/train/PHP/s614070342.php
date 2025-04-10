<?php
while(1) {
    $c = trim(fgets(STDIN));
    if($c == 0){
        break;
    }
    
    $aa = 0;
    $r = 0;
    $wr = 0;
    for ($i = 0; $i < $c; $i++) {
        $n = 0;
        $w = 0;
        
         $ww = trim(fgets(STDIN));
         $www = explode(" ",trim($ww));
        //  print_r($www);
         if(count($www) == 4) {
         $n = $www[0] + $www[1] + $www[2]; 
         $w = $www[3];
         switch($n){
         case $n <= 60:
             $r = 600;
             break;
         case $n <= 80:
            //  echo "llllll";
             $r = 800;
             break;
         case $n <= 100:
            $r = 1000;
            break;
        case $n <= 120:
            $r = 1200;
            break;
        case $n <= 140:
            $r = 1400;
            break;
        case $n <= 160:
            $r = 1600;
            break;
        case $n > 160:
            $r = 666;
            // echo 'kkkkkkkkkk';
            break;
    }
    switch($w){
         case $w <= 2:
             $wr = 600;
             break;
         case $w <= 5:
             $wr = 800;
             break;
         case $w <= 10;
            $wr = 1000;
            break;
        case $w <= 15:
            $wr = 1200;
            break;
        case $w <= 20;
            $wr = 1400;
            break;
        case $w <= 25:
            $wr = 1600;
            // echo "ああああ";
            break;
        case $w > 25:
            $wr = 666;
            break;
    }
    // echo $r . "%%%" . PHP_EOL;
    // echo $wr . '+++' . PHP_EOL;
    if($r == 666 || $wr == 666) {
                    // echo 'mmm';

    } elseif($r < $wr) {
        $aa += $wr;
        // echo "aaaa";
    } else {
        $aa += $r;
    }
    // echo $aa . '::::';
    }
        //  echo $aa . PHP_EOL;
    }
    echo $aa . PHP_EOL;
    
}

