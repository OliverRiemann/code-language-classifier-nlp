<?php
 
$file_handle = fopen('php://stdin', "r"); //fopen()は同位フォルダにファイルがあればその名前のみでOK
//$file_handle = fopen('aoj0235_in.txt', "r");
 
//dfs（再帰ver）(根から葉の親までの距離総計を$leafに格納していく)
function dfs($cur) {
    //グローバル変数定義
    global $dist;
    global $leaf;
    global $flag;
     
    //終了条件不要
    
    //現在の島を探索済みにする
    $flag[$cur['node']] = 1;
     
    $childnode = childnode($cur['node']);
    if (empty( $childnode )) return;
    foreach ($childnode as $island_num => $distance) {
    	if ( $flag[$island_num] === 1 ) continue;
        $grandchildnode = childnode($island_num);
        if (!empty($grandchildnode)) {
            $new['node'] = $island_num;
            $new['dist'] = $cur['dist'] + $dist[$cur['node']][$new['node']];
            dfs($new);
        } else {
            $leaf[$cur['node']] = $cur['dist'];     //ここが葉の親ならば
            $dist[$cur['node']][$island_num] = 0;   //バグの修正。孫ノードが存在しない橋への距離を０に。
            $dist[$island_num][$cur['node']] = 0;   //バグの修正。孫ノードが存在しない橋への距離を０に。
        }
    }
}
 
//子ノード抽出
function childnode($island){
    global $dist;
    global $flag;
   //未探索のみ子ノードとして取り出す
   $childnode = array();
   if (!empty($dist[$island])){
       foreach ($dist[$island] as $key => $val){
           if ($flag[$key] !== 1) {
               $childnode[$key] = $val;
           }
       }
   }
   return $childnode;
}
 
//最も根から葉の親までの距離が大きいものを取り出す
function max_dist($leaf){
    $max = 0;
    foreach ($leaf as $key => $val){
        if ($max < $leaf[$key]){
            $max = $leaf[$key];
        }
    }
    return $max;
}
 
function calc(){
    global $dist;
    global $leaf;
    global $max_dist;
    //まずは葉の親までの全部の橋のコストを合計して2倍。もともとダブルカウントなので全部足し算すればOK
    $sum = 0;
    foreach($dist as $key => $val){
        foreach($dist[$key] as $d2){
            $sum += $d2;
        }
    }
     
    //$sum から、根から葉の親までの距離が最も大きいものをマイナス
    $sum -= $max_dist;
    return $sum;
}
 
while (1){
    //変数の初期化
    $dist = array();
    $leaf = array();    //$leaf[葉の親のnum] = 根からの距離
    $flag = array();	//探索済みかどうか
 
    //ファイル読み込み
    $stdin = fscanf($file_handle, '%d');    //fscanf()で読み込んだものは配列として格納される
    $n = $stdin[0];
    //終了条件
    if ($n == 0){
        break;
    }
     
    for ($i=0; $i < $n-1; $i++){
        $info = fscanf($file_handle, '%d %d %d');
        $parent = $info[0]; $child = $info[1]; $distance = $info[2];
        $dist[$parent][$child] = $distance;
        $dist[$child][$parent] = $distance;
    }
    
    for ($i=1; $i<=$n; $i++){
    	$flag[$i] = 0;	//すべての島を未探索に。
    }
    
 
    //探索
    $stack['node'] = 1;     //スタートを$stackに入れて開始
    $stack['parent'] = NULL;
    $stack['dist'] = 0;
    dfs($stack);
    $max_dist = max_dist($leaf);
    $sum = calc();
    
    //出力
    echo $sum;
    echo PHP_EOL;
}
 
fclose($file_handle);