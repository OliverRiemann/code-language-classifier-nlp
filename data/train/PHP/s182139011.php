<?php
//ワーシャルフロイド（全点対最短路問題）
$file_handle = fopen('php://stdin', "r");
//$file_handle = fopen('aoj0117_in.txt', "r");


function warshall_floyd($cost) {
	global $n;

	for ($i = 1; $i <= $n; ++$i) {
	    for ($j = 1; $j <= $n; ++$j) {
	        for ($k = 1; $k <= $n; ++$k) {
	            // j -> kへ行くのにiを経由した方が良いかどうか(cost)
	            $via_c = $cost[$j][$i] + $cost[$i][$k];
	            if ($via_c < $cost[$j][$k]) {
	                $cost[$j][$k] = $via_c;
	            }
	        }
	    }
	}
	return $cost;
}


//変数の初期化


//ファイル読み込み
$n = trim(fgets($file_handle));

//ワーシャルフロイド準備。
for ($i=1; $i<=$n; ++$i){
	for ($j=1; $j<=$n; ++$j){
		if ($i === $j){
			$cost[$i][$i] = 0;
		} else {
			$cost[$i][$j] = INF;
		}
	}
}

$m = trim(fgets($file_handle));
for ($i=1; $i<=$m; ++$i){
	$info = trim(fgets($file_handle));
	$explode = explode(',', $info);
	$a1 = $explode[0]; $b1 = $explode[1]; $c1 = $explode[2]; $d1 = $explode[3];
	$cost[$a1][$b1] = $c1; $cost[$b1][$a1] = $d1;
}
$info2 = trim(fgets($file_handle));
$explode = explode(',', $info2);
$start = $explode[0]; $goal = $explode[1]; $y1 = $explode[2]; $y2 = $explode[3];


//探索
$res = warshall_floyd($cost);

//収支計算
$income = $y1;
$expense = $res[$start][$goal] + $res[$goal][$start] + $y2;
$output = $income - $expense;


//出力
echo $output;
echo PHP_EOL;


fclose($file_handle);