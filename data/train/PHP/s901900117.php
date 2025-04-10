<?php
$table = null;
$num = null;
$i = null;
$j = null;
$size = null;

function main() {
	global $num;
	while($n = trim(fgets(STDIN))) {
		init($n);
		while ($num <= $n * $n) {
			trynext();
		}
		printTable();
	}
}

function init($n) {
	global $table, $num, $i, $j, $size;
	initTable($table, $n);
	$size = $n;
	$num = 1;
	$i = (int)($n/2) + 1;
	$j = (int)($n/2);
}

function initTable(&$table, $n) {
	$row = array_fill(0, $n, 0);
	for ($i = 0; $i < $n; $i++) {
		$table[$i] = $row;
	}
}

function trynext() {
	global $table, $num, $i, $j, $size;

	// はみ出る場合
	if ($j >= $size) {
		$j = 0;
	}
	if ($j < 0) {
		$j = $size - 1;
	}
	if ($i >= $size) {
		$i = 0;
	}

	if ($table[$i][$j] > 0) {
		$i++;
		$j--;
		trynext();
	} else {
		// 格納成功
		$table[$i][$j] = $num;
		// 次の基本位置
		$i++;
		$j++;
		$num++;
		return;
	}
}

function printTable() {
	global $table, $size;
	for ($i = 0; $i < $size; $i++) {
		$row = "";
		for ($j = 0; $j < $size; $j++) {
			$row .= sprintf("%4d", $table[$i][$j]);
		}
		echo rtrim($row) . "\n";
	}
}

main();