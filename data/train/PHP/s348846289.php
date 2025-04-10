<?php
define('DEBUG', 0);
$dx = [0, 1, 0, -1];
$dy = [1, 0, -1, 0];
$cells = array(
  'A'=>[0,0],
  'B'=>[1,0],
  'C'=>[2,0],
  'D'=>[0,1],
  'E'=>[1,1],
  'F'=>[2,1],
  'G'=>[0,2],
  'H'=>[1,2],
  'I'=>[2,2]);

$memo = array();

function f($cx, $cy, $n, $t, $b) { // $cx,$cy:セル座標、$n:残りバッテリ
if (DEBUG) echo "$cx, $cy, $n, $t, $b:";
  global $cells, $dx, $dy, $memo;
  // メモチェック
  if (array_key_exists("$cx:$cy:$n", $memo)) {
if (DEBUG) echo $memo["$cx:$cy:$n"]."\n";
    return $memo["$cx:$cy:$n"];
  }
  if ($n == 0) {
    // バッテリがなくなった
    if ($cx == $cells[$t][0] && $cy == $cells[$t][1]) {
      // 充電器で終了
if (DEBUG) echo "1\n";
      return 1;
    } else {
if (DEBUG) echo "0_1\n";
      return 0;
    }
  }

  // 4方向に移動する
  $ret = 0;
  for($i=0; $i<4; ++$i) {
    $x = $cx + $dx[$i];
    $y = $cy + $dy[$i];
    if ($x < 0 || 2 < $x || $y < 0 || 2 < $y
       || ($x == $cells[$b][0] && $y == $cells[$b][1])) {
      // 壁にあたった、又は、倉庫にぶつかったので座標を元に戻す
      $x = $cx;
      $y = $cy;
    }
if (DEBUG) echo "f\n";
    $ret += f($x, $y, $n-1, $t, $b);
  }
// error_log("ret:$ret");
  // メモ化
  $memo["$cx:$cy:$n"] = $ret;
if (DEBUG) echo "$ret\n";
  return $ret;
}

while ($n = chop(fgets(STDIN))) {
  list($s, $t, $b) = explode(' ', chop(fgets(STDIN)));
  $memo = array();
  $num = f($cells[$s][0], $cells[$s][1], $n, $t, $b);
  echo sprintf('%.8f', $num / pow(4, $n)) . "\n";
  unset($memo);
}

