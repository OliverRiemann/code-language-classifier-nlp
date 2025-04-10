<?php
//その都度計算しているとTLEになるので、最初に$max値で計算
 
$max = 1000000;
 
// 配列の初期化。素数には１が入る。ここがポイント。
for ($i = 0; $i < $max; $i++) {
    $array[$i] = 1;
}
$array[1] = 0;
 
// ふるい。０と１は素数では無いので２から探索開始
for ($i=2; $i<$max; $i++) {
  if ( $array[$i]===0 )
    // スタート値がふるい落とされていたら、その倍数も既出
    continue;
  else
    // $i自身は素数なので除外。$i*$i未満の組み合わせは既出なので除外。
    for ($j=$i*$i; $j<$max; $j+=$i) {
      $array[$j] = 0;
    }
}
 
// 各整数にそれ以下の素数の総数を格納。ここがポイント。
for ($i=2; $i<$max; $i++){
  $array[$i] += $array[$i-1];   //素数ならば１が入っているのでカウンターとして使う。
}
 
while(1){
  $res = fscanf(STDIN, '%d', $n);
  if ($res==0) break;
 
  $cnt = $array[$n];
 
  // 出力
  echo $cnt.PHP_EOL;
}