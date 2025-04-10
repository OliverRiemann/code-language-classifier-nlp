<?php
$a = array(0,1,2,3,4,5,6,7,8,9);

function dfs($i, $n, $s, $sum, $stack){
	//PHPでグローバル変数を書き換える場合はglobal宣言が必要
	global $a;
	global $ans;

	//終了条件
	if ( $i == count($a) ) {
		//解に当てはまるかチェック
		if ($sum == $s && count($stack) == $n) {
			$ans[] = array_slice($stack, 0);	//解の状態をansスタックに保持
		}
		return ;
	}
	
	//スタックに追加するかどうかの分岐
	// a[i]を使わない場合
	dfs($i+1, $n, $s, $sum, $stack);
	// a[i]を使う場合
	array_push($stack, $a[$i]);	//スタックに追加
	dfs($i+1, $n, $s, $sum+$a[$i], $stack);
	array_pop($stack);	//スタックから下ろす
}

while (1) {
	fscanf(STDIN, '%d %d', $n, $s);
	
	//変数の初期化
	$i = 0;
	$sum = 0;
	$stack = array();
	$ans = array();
	
	if ($n == 0 && $s == 0) {
		break;
	}

	//探索の実行
	dfs($i, $n, $s, $sum, $stack);
	//解の数をカウント
	$len_ans = count($ans);
	//出力
	echo $len_ans;
	echo PHP_EOL;
}