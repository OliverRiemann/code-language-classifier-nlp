<?php
    $tmp_line = array();
    while($line = trim(fgets(STDIN))){
        $tmp_line[] = $line;
    }
    foreach($tmp_line as $val){
        $math = explode(" ",$val);
        $koyaku;
        $kobaisu;
        if($math[0]>$math[1]){
            $tmp = $math[0] - $math[1];
            $tmp2 = $math[1];
            while($tmp != $tmp2){
                if($tmp > $tmp2){
                    $tmp = $tmp - $tmp2;
                }else{
                    $tmp2 = $tmp2 - $tmp;
                }
            }
            $koyaku = $tmp;
        }else if($math[0]<$math[1]){
            $tmp = $math[1] - $math[0];
            $tmp2 = $math[0];
            while($tmp != $tmp2){
                if($tmp > $tmp2){
                    $tmp = $tmp - $tmp2;
                }else{
                    $tmp2 = $tmp2 - $tmp;
                }
            }
            $koyaku = $tmp;
        }else{
            $koyaku = $math[0];
        }
        $kobaisu = ($math[0] * $math[1]) / $koyaku;
        echo $koyaku." ".$kobaisu."\n";
    }

