<?php
while ($g = rtrim(fgets(STDIN))){ 
    $a = preg_split("/[\s,]+/", $g);
    // print_r($a);
    //あなたのカード合計
    $player_sum = $a[0] + $a[1];
    // print_r($player_sum);
    //20までの数字
    $player_left = 20 - $player_sum;
    // print $player_left;
    //相手カード
    // print $player_left;
    // print 'pl';
    // print PHP_EOL;
    $opponent_card = $a[2];
    // print $a[2];
    //残りのカード
    $card_all = [];
    for ($i=1; $i <= 10 ; $i++) {
        if ($i == $a[0]){
            $card_all[] = 0;
        } else if ($i == $a[1]){
            $card_all[] = 0;
        } else if ($i == $a[2]){
            $card_all[] = 0;
        } else {
            $card_all[] = $i;
        }
    }
    // print_r($card_all);
    // 各残りのカードが$player_leftより小さいか等しい数を数える。
    $count = 0;
    for ($i=0; $i < 10 ; $i++) { 
        if($card_all[$i] <= $player_left && $card_all[$i] !== 0){
            $count++;
        }
    }
    if ($count >= 4){
        print 'YES';
    } else {
        print 'NO';
    }
    print PHP_EOL;
    // $countが４以上であったら、Yes, それ以外はNoにする。

}
