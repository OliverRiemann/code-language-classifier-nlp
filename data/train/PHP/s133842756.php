<?php
//マップを読み込む。左上から一マスずつ読み込んでいく($map['y']['x'])。（分岐）もし該当マスが陸だったら
//深さ優先探索をかける。該当マスの上下左右($move = array(array(1,0),array(0,1),array(-1,0),array(0,-1)))
//を調査。そこにマスがあり且つ陸ならば、さらにそのマスから探索。調査した陸は海扱いして再訪を防ぐ。
//http://d.hatena.ne.jp/nanikaka/20110727/1311790350 参考

$file_handle = fopen('php://stdin', "r");
$move = array(array(1,0),array(0,1),array(-1,0),array(0,-1));

//dfs
function dfs($y, $x){
	global $move;
	global $map;

	$map[$y][$x] = 0;	//海扱い
	for ($i=0; $i<=3; $i++){	//上下左右を調査
		$y2 = $y + $move[$i][1];
		$x2 = $x + $move[$i][0];
		if (!empty($map[$y2][$x2]) && $map[$y2][$x2]==1){
			dfs($y2, $x2);
		}
	}
	return;
}

do {
	$num_island = 0;	//島の数
	$map = array();

	//map 読み込み
	for($y=0; $y<=11; $y++){
		$stdin = trim(fgets($file_handle));
		$map[$y] = str_split($stdin);	//ここで詰まった。今回はデリミターが無い（今までは半角スペース）
	}
	
	//一マスずつ探索
	for($y=0; $y<=11; $y++){
		for($x=0; $x<=11; $x++){
			if ($map[$y][$x] == 1){		//該当マスが陸だった場合
				dfs($y, $x);
				$num_island++;
			}
		}
	}

	//出力
	echo $num_island;
	echo PHP_EOL;
	
	//データセットの終わりを判定
	$stdin = fgets($file_handle);
	$flag = ($stdin == PHP_EOL) ? 1 : 0;
} while ($flag === 1);

fclose($file_handle);