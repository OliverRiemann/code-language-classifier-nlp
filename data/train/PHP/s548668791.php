<?php
//(map座標全てに0を入れる) $map[$c][$y][$x]として、ブロックがある座標を１に。
//スタート地点上にあるブロックの「色」を調べる。なければNG。その色のブロックの座標のみたどる。
//スタート地点から深さ優先探索でmove。ゴールまでたどり着ければOK。ダメならNG

$move = array(array(1,0),array(0,1),array(-1,0),array(0,-1));

//dfs
function dfs($c, $y, $x){
	global $move;
	global $map;
	global $goal_flag;
	global $yg;
	global $xg;

	if ($y === $yg && $x === $xg){	//終了条件
		$goal_flag = 1;
		return;
	}

	$map[$c][$y][$x] = 0;	//再訪防止
	for ($i=0; $i<=3; $i++){	//上下左右を調査
		$y2 = $y + $move[$i][1];
		$x2 = $x + $move[$i][0];
		if (!empty($map[$c][$y2][$x2]) && $map[$c][$y2][$x2]===1){
			dfs($c, $y2, $x2);
		}
	}
	return;
}

while(1){
	//初期化
	$goal_flag = 0;
	$map = array();
	$usecolor = 0;		//たどる色

	//ファイル読み込み
	fscanf(STDIN, '%d %d', $w, $h);
	//終了判定
	if ($w==0 && $h==0){
		break;
	}
	fscanf(STDIN, '%d %d', $xs, $ys);
	fscanf(STDIN, '%d %d', $xg, $yg);
	fscanf(STDIN, '%d', $n);
	for ($i=0; $i<$n; $i++){
		fscanf(STDIN, '%d %d %d %d', $c, $d, $xblock, $yblock);
		//ブロックがある座標を１に
		if ($d === 0){		//方向転換なし
			for ($p=0; $p<=3; $p++){
				for ($q=0; $q<=1; $q++){
					$map[$c][$yblock + $q][$xblock + $p] = 1;
				}
			}
		} else {
			for ($p=0; $p<=1; $p++){
				for ($q=0; $q<=3; $q++){
					$map[$c][$yblock + $q][$xblock + $p] = 1;
				}
			}
		}
	}

	//スタート地点上の色判定
	for ($c=1; $c<=5; $c++){
		if (!empty($map[$c][$ys][$xs]) && $map[$c][$ys][$xs] === 1){
			$usecolor = $c;
			break;
		}
	}

	//スタート地点から探索
	if ($usecolor !== 0){
		dfs($usecolor, $ys, $xs);
	}
	//出力
	if ($goal_flag === 1){
		echo 'OK';
	} else {
		echo 'NG';
	}
	echo PHP_EOL;
}