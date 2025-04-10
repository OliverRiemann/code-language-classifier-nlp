<?php
//ガウスジョルダン法

$count = 2;	//未知数の数
$value = array();	//係数配列

while(1){
	$res =fscanf(STDIN, '%d %d %d %d %d %d', $a,$b,$c,$d,$e,$f);
	if ($res==0) break;
	
	$value[0][0]=$a;  $value[0][1]=$b;  $value[0][2]=$c;
	$value[1][0]=$d;  $value[1][1]=$e;  $value[1][2]=$f;
	
	// $a or $e が０だと処理が止まるので入れ替えておく
        if ($a===0 || $e===0) {
		$value[0][0]=$d;  $value[0][1]=$e;  $value[0][2]=$f;
		$value[1][0]=$a;  $value[1][1]=$b;  $value[1][2]=$c;
	}
	
	for($i=0; $i<$count; ++$i){
		//注目式の未知数の係数を1にするためにその係数を格納
		$a = $value[$i][$i];
		
		//注目式の未知数の係数を1にするために注目式全体をaで割る
		for($j=$i; $j<=$count; ++$j){
			$value[$i][$j] = $value[$i][$j]/$a;
		}
		
		//注目式以外の未知数の係数を0にする
		for($j=0; $j<$count; ++$j){
			//注目式ならばスルー
			if ($j===$i) continue;
			//注目式以外の未知数の係数を格納
			$tmp = $value[$j][$i];
			//その値を0にするため、注目式との演算を行う
			for($k=0; $k<=$count; ++$k){
				//$value[$i][$k] が注目式の該当未知数の係数
				$value[$j][$k] = $value[$j][$k] - $tmp*$value[$i][$k];
			}
		}
	}
	
	//計算結果
	$x = $value[0][2];  $y = $value[1][2];
	$x = round($x, 3);  $y = round($y, 3);
	$x = sprintf('%.3f', $x);  $y = sprintf('%.3f', $y);
	echo $x.' '.$y.PHP_EOL;
}