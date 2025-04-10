<?php
$case = 0;
while(true){
    $input_line = fgets(STDIN);
    $W = str_replace(array("\r\n","\r","\n"), '', $input_line);
    $input_line = fgets(STDIN);
    $N = str_replace(array("\r\n","\r","\n"), '', $input_line);    
    if($W == 0) {
        break;
    }
    $case++;
    $array_v = array(-1);
    $array_w = array(-1);
    for($i = 0; $i < $N; $i++){
        $input_line = fgets(STDIN);
        $input_line = str_replace(array("\r\n","\r","\n"), '', $input_line);
        $array = explode(",", $input_line);
        array_push($array_v, $array[0]);
        array_push($array_w, $array[1]);
    }
    $dp = array();
    $dp_w = array();
    for($i = 0; $i <= $N; $i++){
        for($j = 0; $j <= $W; $j++){
            $x = 0;
            $y = 0;
            $x_w = 0;
            $y_w = 0;
            if($i == 0){
                $dp[$i][$j] = 0;
                $dp_w[$i][$j] = 0;
            } else{
                $x = $dp[$i - 1][$j];
                $x_w = $dp_w[$i - 1][$j];
                if($array_w[$i] <= $j) {
                    $y = $dp[$i - 1][$j - $array_w[$i]] + $array_v[$i];
                    $y_w = $dp_w[$i - 1][$j - $array_w[$i]] + $array_w[$i];
                }
                $dp[$i][$j] = ($x > $y) ? $x : $y;
                $dp_w[$i][$j] = ($x > $y) ? $x_w : $y_w;
            }

        }
        //不要なメモリ解放
        if ($i >= 2) {
            unset($dp[$i-2]);
        }

    }
    /*
     * デバッグ用出力
    for($i = 0; $i <= $N; $i++){
        echo $i."| ";
        for($j = 0; $j <= $W; $j++){
            echo $dp[$i][$j]." ";
        }
        echo "\n";
    }
    echo "weight;\n";
    for($i = 0; $i <= $N; $i++){
        echo $i."| ";
        for($j = 0; $j <= $W; $j++){
            echo $dp_w[$i][$j]." ";
        }
        echo "\n";
    }
    */
    $array_ans_w = array();
    for($j = 0; $j <= $W; $j++){
        if($dp[$N][$j] == $dp[$N][$W]){
            array_push($array_ans_w, $dp_w[$N][$j]);
        }
    }
    echo "Case {$case}:\n";
    echo $dp[$N][$W] . "\n";
    echo min($array_ans_w) . "\n";
}
?>
