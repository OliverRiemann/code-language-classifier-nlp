<?php
// メモ化テーブル
$case = 0;
while (TRUE) {
	$dp = array();
	$W = trim(fgets(STDIN));
	if ($W == 0) {
		break;
	}
	$case++;
	$N = trim(fgets(STDIN));
	$items = array();
	for ($i = 0; $i < $N; $i++) {
		list($v, $w) = explode(',', trim(fgets(STDIN)));
		$items[] = array('value' => $v, 'weight' => $w);
	}
	$res = rec(0, $W, 0);
	echo "Case {$case}:\n";
	echo $res[0] . "\n";
	echo $res[1] . "\n";
}

// i 番目以降の重さの総和が w 以下となるように選ぶやりかた
function rec($i, $w, $total) {
	global $dp, $N, $items;
	if (isset($dp[$i][$w])) {
		return $dp[$i][$w];
	}
	$res = null;
	if ($i == $N) {
		// もう宝物は残っていない
		$res =  array(0, $total);
	} elseif ($w < $items[$i]['weight']) {
		// この品物は入らないので、入れずに次を調べる
		$res = rec($i + 1, $w, $total);
	} else {
		// 入れる場合と入れない場合を両方試す
		$v1 = rec($i + 1, $w, $total);
		$v2 = rec($i + 1, $w - $items[$i]['weight'], $total + $items[$i]['weight']);
		$v2[0] += $items[$i]['value'];
		if ($v1[0] < $v2[0]) {
			$res = $v2;
		} else {
			$res = $v1;
		}
	}
	return $dp[$i][$w] = $res;
}