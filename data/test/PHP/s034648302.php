<?php
$string_tmp = array();
// 回答保存用
$ans_set = array();
// 入力受付処理
while ($line = fgets(STDIN)) {
   $tmp[] = trim($line);
}
// INIT処理
$max_lenge = 8;
foreach($tmp as $val){
    // データセットをデクリメント
    $max_lenge--;
    // 1があるかどうかを確認
    if(preg_match('/1/',$val)){
        $string_tmp[] = $val;
    }// 一つデータセットを見終わった時の処理
     // 見つかった行数によって図形を判別
    if($max_lenge < 0){
        $tmp_length = count($string_tmp);
        if($tmp_length == 4){
            $ans_set[] = "B";
        }elseif($tmp_length == 1){
            $ans_set[] = "C";
        }elseif($tmp_length == 2){
            $ans_set[] = judge_line2($string_tmp);
        }elseif($tmp_length == 3){
            $ans_set[] = judge_line3($string_tmp);
        }
        // INIT 処理
        $string_tmp = array();
        $max_lenge = 8;
    }
}
$ans_set[] = judge($string_tmp);
foreach($ans_set as $val){
    echo $val."\n";
}
function judge($string_tmp){
    $ans;
    $tmp_length = count($string_tmp);
        if($tmp_length == 4){
            $ans = "B";
        }elseif($tmp_length == 1){
            $ans = "C";
        }elseif($tmp_length == 2){
            $ans = judge_line2($string_tmp);
        }elseif($tmp_length == 3){
            $ans = judge_line3($string_tmp);
        }
    return $ans;
}
// ラインが二列だった時の図形判別用
function judge_line2($string_tmp){
    $pos = strpos($string_tmp[0], "1");
    $pos2 = strpos($string_tmp[1], "1");
    if($pos == $pos2){
        return "A";
    }elseif ($pos < $pos2) {
        return "E";
    }else{
        return "G";
    }
}// ラインが三列だった時の図形判別用    
function judge_line3($string_tmp){
    $pos = strpos($string_tmp[0], "1");
    $pos2 = strpos($string_tmp[1], "1");
    if($pos > $pos2){
        return "D";
    }else{
        return "F";
    }
}
