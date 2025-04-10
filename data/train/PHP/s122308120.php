<?php
//外心＝各辺の垂直二等分線の交点
//傾きの積が-1ならば、その2直線は垂直に交わる

$file_handle = fopen('php://stdin', "r");

fscanf($file_handle, '%d', $n);

for($i=1; $i<=$n; $i++){
	fscanf($file_handle,'%f %f %f %f %f %f',$x1,$y1,$x2,$y2,$x3,$y3);
	
	// 3辺の方程式、y=ax+b のa,bを求める
	// 傾きから。0除算注意
	// 同時に垂直二等分線の傾きも求めておく
	if ( ($x1-$x2)==0 ){
		$a1 = false;
		$ra1 = 0;
	} else if ( ($y1-$y2)==0 ){
		$a1 = 0;
		$ra1 = false;
	} else {
		$a1 = ($y1-$y2) / ($x1-$x2);
		$ra1 = -1 / $a1;
	}
	if ( ($x2-$x3)==0 ){
		$a2 = false;
		$ra2 = 0;
	} else if ( ($y2-$y3)==0 ){
		$a2 = 0;
		$ra2 = false;
	} else {
		$a2 = ($y2-$y3) / ($x2-$x3);
		$ra2 = -1 / $a2;
	}
	if ( ($x3-$x1)==0 ){
		$a3 = false;
		$ra3 = 0;
	} else if ( ($y3-$y1)==0 ){
		$a3 = 0;
		$ra3 = false;
	} else {
		$a3 = ($y3-$y1) / ($x3-$x1);
		$ra3 = -1 / $a3;
	}
	// 切片不要
	//$b1 = $y1 - $a1*$x1;
	//$b2 = $y2 - $a2*$x2;
	//$b3 = $y3 - $a3*$x3;
	// 垂直二等分線の方程式を求める。
	// 三角形の各辺の中点を求める。
	$mx1 = ($x1+$x2)/2;  $my1 = ($y1+$y2)/2;
	$mx2 = ($x2+$x3)/2;  $my2 = ($y2+$y3)/2;
	$mx3 = ($x3+$x1)/2;  $my3 = ($y3+$y1)/2;
	// 切片を
	$rb1 = $my1 - $ra1*$mx1;
	$rb2 = $my2 - $ra2*$mx2;
	$rb3 = $my3 - $ra3*$mx3;
	// 垂直二等分線2本に注目し、その交点を求める
	if ($ra1 !== false && $ra2 !== false) {
		$px = ($rb2-$rb1) / ($ra1-$ra2);
		$py = $ra1*$px + $rb1;
	} else if ($ra2 !== false && $ra3 !== false) {
		$px = ($rb3-$rb2) / ($ra2-$ra3);
		$py = $ra2*$px + $rb2;
	} else if ($ra3 !== false && $ra1 !== false) {
		$px = ($rb1-$rb3) / ($ra3-$ra1);
		$py = $ra3*$px + $rb3;
	}
	// 外接円の半径ｒを求める。sqrt:SQuare RooT(平方根)
	$sqr = pow($px-$x1,2) + pow($py-$y1,2);
	$r = sqrt($sqr);
	// 整形
	$px = round($px, 3); $px = sprintf('%.3f', $px);
	$py = round($py, 3); $py = sprintf('%.3f', $py);
	$r = round($r, 3);   $r = sprintf('%.3f', $r);
	// 出力
	echo $px.' '.$py.' '.$r.PHP_EOL;
}