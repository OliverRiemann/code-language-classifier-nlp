<?php
fscanf(STDIN, "%d", $target_count);
$heights = array_map("intval", explode(" ", trim(fgets(STDIN))));

$target_tmp = [0];
$prev = 0;
for ($i = 0; $i < count($heights); ++$i) {
    if ($heights[$i] != $prev) $target_tmp[] = $heights[$i];
    $prev = $heights[$i];
}
array_push($target_tmp, 0);
//メモリ解放
$heights = [];

$target = [0];
$prev = 0;
for ($i = 1; $i < count($target_tmp)-1; ++$i) {
    if (($prev < $target_tmp[$i] && $target_tmp[$i] > $target_tmp[$i+1]) || ($prev > $target_tmp[$i] && $target_tmp[$i] < $target_tmp[$i+1])) $target[] = $target_tmp[$i];
    
    $prev = $target_tmp[$i];

}
//メモリ解放
$target_tmp = [];

$mountain = [];
$valley = [];

for ($i = 0; $i < count($target); ++$i){
	if ($i%2 == 1) {
		$mountain[] = $target[$i];
	} else {
		$valley[] = $target[$i];
	}
}

sort ($target);
sort ($mountain);
sort ($valley);
array_push($target, 0);
array_push($mountain, 0);
array_push($valley, 0);

$ans = 0;
$max = 0;

if(count($target) == 1){
    echo $max, "\n";
	return ;
}

$m = 0;
$b = 0;

for ($i = 0; $i < count($target)-1; ++$i) {
    if ($mountain[$m] == $target[$i]) {
        ++$m;
        --$ans;
    } 
    if ($valley[$b] == $target[$i]) {
        ++$b;
        ++$ans;
    }
    
    if ($target[$i] < $target[$i+1]) {
        if ($ans > $max) $max = $ans;
    }

}


echo $max, "\n";

