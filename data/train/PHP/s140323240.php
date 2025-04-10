<?php
//$queueからarray_shift()でひとつ頭を取り出す。
//$ary[]に体節の並びを保持。体節の長さ分だけfor(foreach)でまわして $ary[$i] と $ary[$i+1] とを比較
//もし、色が違えば$queueに次階層の状態を追加($array_push)
//体節の色がすべて同じなら終了する。

$file_handle = fopen('php://stdin', "r");	//fopen()は同位フォルダにファイルがあればその名前のみでOK


//wfs
function wfs() {
	global $cnt;
	global $sec;
	global $ary_start;
	global $goal_flag;
	global $queue;

	$queue[0] = $ary_start;			//スタートを$queueに入れて開始
	$queue_size = count($queue[0]);	//キューの長さを取得
	$queue[0]['sec'] = 0;			//スタート時の秒数(階層の深さ)を入れる
	while (!empty($queue)) {		//$queueが1つ以上あればループ
	   $cur = array_shift($queue);	//配列$queueの頭から１つ取り出す。
	   
	   //終了条件。全ての配列が同じ色なら終了
	   $cnt = 0;	//カウントの初期化
	   for($i=0; $i<$queue_size; $i++){
	       if ($cur[$i] !== $cur[0]){ break; }
	       $cnt++;
	   }
	   if ($cnt === $queue_size) {
	       $goal_flag = 1;
	       $sec = $cur['sec'];	//ゴールした時の秒数
	       break;	//色がすべて同じならwhileを抜ける
	   }
	   
	   //探索
	    for($i=0; $i<$queue_size-1; $i++){
	    	if ($cur[$i] !== $cur[$i+1]){	//隣接する体節の色が違う場合
    			$new = $cur;
    			$new['sec'] = $cur['sec'] + 1;		//（バグ３に関して）キュー自身に階層情報を持たせるのが一番早い
	    		//変化する色ごとに場合分け
	    		if ($cur[$i] !== 'r' && $cur[$i+1] !== 'r'){	//次の階層で赤になる場合
	    			$new[$i] = 'r';  $new[$i+1] = 'r';
	    		} else if ($cur[$i] !== 'g' && $cur[$i+1] !== 'g'){
	    			$new[$i] = 'g';  $new[$i+1] = 'g';
	    		} else {
	    			$new[$i] = 'b';  $new[$i+1] = 'b';
	    		}
	    		$str = toString($new);
	    		if (empty($visited[$str])){	//未探索の場合。バグの原因２。この再訪防止処置が無いと同じパターンを何度も辿ることになり効率が非常に悪くなる
		    		array_push($queue, $new);
				    $visited[$str] = 1;		//pushしたキューを探索済みに追加
				}
	    	}
	    }
	    //$sec++;
	    //バグの原因３。一番嵌った場所。位置がNG。階層が進んだところでインクリメントする必要あり。
	    //これだとnodeをひとつ調べるたびに秒数が増えていってしまう。
	}
}

//再訪防止用。配列のキーに文字列を設定するために使用
function toString($ary){
	$str = '';
	foreach ($ary as $key => $val){
		if (is_numeric($key)) {		//配列のキーが数値ならば（secがあるので）
			$str = $str.$val;
		}
	}
	return $str;
}


while (1){
	//変数の初期化
	$cnt = 0;	//終了条件に使用
	$sec = 0;
	$goal_flag = 0;
	$queue = array();

	//ファイル読み込み
	$stdin = trim(fgets($file_handle));
	//終了条件
	if ($stdin == '0'){		//バグの原因１。 === とか == 0 だとバグ
		break;
	}
	$ary_start = str_split($stdin);
	

	//探索
	wfs();

	//出力
	if ($goal_flag === 1){
		echo $sec;
	} else {
		echo 'NA';
	}
	echo PHP_EOL;
}

fclose($file_handle);