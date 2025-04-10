<?php
//ワーシャルフロイド（全点対最短路問題）
$file_handle = fopen('php://stdin', "r");
//$file_handle = fopen('aoj0189_in.txt', "r");


function warshall_floyd($d) {
	global $m;

	for ($i = 0; $i <= $m; ++$i) {
	    for ($j = 0; $j <= $m; ++$j) {
	        for ($k = 0; $k <= $m; ++$k) {
	            // j -> kへ行くのにiを経由した方が良いかどうか(cost)
	            $via = $d[$j][$i] + $d[$i][$k];
	            if ($via < $d[$j][$k]) {
	                $d[$j][$k] = $via;
	            }
	        }
	    }
	}
	return $d;
}

while(1){
	//ファイル読み込み
	$n = trim(fgets($file_handle));     //道の数(町の数では無い)
	
	//終了条件
	if ($n == 0) break;
	
	//変数初期化
	$d = array();
	$num_city = 0;
	
	for ($i=1; $i<=$n; ++$i){
		$info = trim(fgets($file_handle));
		$explode = explode(' ', $info);
		$a = $explode[0]; $b = $explode[1]; $c = $explode[2];
		$d[$a][$b] = $d[$b][$a] = $c;
		//最大値をとって町の数を取る。
		$num_city = max($num_city, $a, $b);
	}
	$m = $num_city;

	//町の数で
	//ワーシャルフロイド準備。
	for ($i=0; $i<=$m; ++$i){
		for ($j=0; $j<=$m; ++$j){
			//定義済みならばcontinue
			if ( isset($d[$i][$j]) ) continue;
			if ($i === $j){
				$d[$i][$i] = 0;
			} else {
				$d[$i][$j] = INF;
			}
		}
	}

	//探索
	$res = warshall_floyd($d);

	//最小値の通勤時間総和計算
	$sum_dist = array();	//各町からの距離総和
	$min_dist = INF;		//最小距離総和
	$min_city = '';			//距離総和が最小の町番号

	for ($i=0; $i<=$m; ++$i){
		$sum_dist[$i] = 0;	//距離初期化
	}
	for ($i=$m; $i>=0; --$i){	//同値の場合はより町番号が小さい方を採用するので逆順
		for ($j=$m; $j>=0; --$j){
			$sum_dist[$i] += $res[$i][$j];
		}
		//最小値比較・更新
		if ($min_dist >= $sum_dist[$i]){
			$min_dist = $sum_dist[$i];
			$min_city = $i;
		}
	}

	//出力
	echo $min_city.' '.$min_dist;
	echo PHP_EOL;

}

fclose($file_handle);