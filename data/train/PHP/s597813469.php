<?php
//上の段の一番右のカードを、下の段の一番左のカードと交換してしまうミスに気をつけてください。
//最初にゴールの状態からとりうる全パターン（８！通り）を探索し、各パターンへの最小手数を記録しておく。
//普通にやったらTime Limit Exceededになったので。

$file_handle = fopen('php://stdin', "r");	//fopen()は同位フォルダにファイルがあればその名前のみでOK
//$file_handle = fopen('aoj0121_in.txt', "r");

$goal = array(0,1,2,3,4,5,6,7);	//goal state
$move = array(-4, 1, 4, -1);	//0が↑→↓←に動く場合
$visited = array();

//wfs
function wfs() {
	//グローバル変数定義
	global $goal;
	global $move;
	global $visited;
	
	$str = toString($goal);
	$visited[$str] = 0;			//最初の状態を探索済みに追加。代入するのは最短手数
	$queue[0] = $goal;			//ゴールを$queueに入れて開始
	$queue[0]['dist'] = 0;
	while (!empty($queue)) {
	   $cur = array_shift($queue);	//$queueの『頭』から１つ取り出す。
	   
	   //終了条件は不要
	   
	   //探索ロジック
	   //０がどこにあるか
	   for ($i=0; $i<=7; $i++) {
	       if ($cur[$i]===0){
	           $zero = $i;
	           break;
	       }
	   }
	   
	   for ($i=0; $i<=3; $i++) {
	       //スワップ
	       $new_zero = $zero + $move[$i];		//ゼロの位置を移動
	       $new = $cur;		//バグの原因修正１。for文なので$curのままスワップ操作するとNG
	       if ($new_zero>=0 && !empty($new[$new_zero])) {
	           if ($zero===3 && $new_zero===4){ continue; }    //バグの修正２。
	           if ($zero===4 && $new_zero===3){ continue; }    //バグの修正２。
	           $new[$zero] = $new[$new_zero];
	           $new[$new_zero] = 0;
	           //未探索か
	           $str = toString($new);
	           if (!isset($visited[$str])) {				//バグの修正１。empty()は数値の0、文字列の'0'も空と見なしてしまう。ここはisset()が良い
				    $new['dist'] = $cur['dist'] + 1;
				    $visited[$str] = $new['dist'];		//発見したパターンに手数を入れておく
		    		array_push($queue, $new);
	           }
	       }
	   }
	}
}

//toString
function toString($ary){
	$str = '';
	foreach ($ary as $key => $val){
		if (is_numeric($key)) {		//配列のキーが数値ならば（distがあるので）
			$str = $str.$val;
		}
	}
	return $str;
}

//探索
wfs();
//print_r($visited);

while (1){
	//変数の初期化

	//ファイル読み込み
	$ary_start = fscanf($file_handle, '%d %d %d %d %d %d %d %d');
	//終了条件
	if ($ary_start === false){
		break;
	}
	
	//最短手数を計算
	$str = toString($ary_start);
	
	//出力
	if (isset($visited[$str])){
		echo $visited[$str];
	} else {
		echo 'ERROR';
	}
	echo PHP_EOL;
}

fclose($file_handle);