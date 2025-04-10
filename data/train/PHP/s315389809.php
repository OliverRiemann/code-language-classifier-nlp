<?php
    while (true) {
        $num = trim(fgets(STDIN));
        if (strlen($num <= 3)){
                break;
        }
        $hit = 0;
        $brow = 0;
        $brow2 = 0;
        $num = str_split($num);
        // var_dump($num);
        for($i = 0; $i < 4; $i++){
            if($num[$i] == $num[5]){
                $brow++;
            }if($num[$i] == $num[6]){
                $brow++;
            }if($num[$i] == $num[7]){
                $brow++;
            }if($num[$i] == $num[8]){
                $brow++;
            }
        }
                if ($num[0] == $num[5]) {
                    $hit++;
                    $brow--;
                }if ($num[1] == $num[6]) {
                    $hit++;
                    $brow--;
                }if ($num[2] == $num[7]) {
                    $hit++;
                    $brow--;
                }if ($num[3] == $num[8]) {
                    $hit++;
                    $brow--;
                }
            echo $hit . " " . $brow . "\n";
    }
