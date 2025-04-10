<?php

while (($line = trim(fgets(STDIN))) !== '') {
    $card = array_fill(1, 13, 0);
    foreach (explode(',', $line) as $c) {
        $card[(int)$c]++;
    }

    //配られたカードだけにする
    $card = array_filter($card, function ($n) {
        return $n;
    });
    $pair = max($card);
    //カードの種類
    $cnt = count($card);

    //4カード
    if ($pair === 4) {
        echo "four card\n";

    //フルハウス
    } elseif ($pair === 3 && $cnt === 2) {
        echo "full house\n";

    //ペアがない
    } elseif ($cnt === 5) {
        //1番小さいカード
        $min = min(array_keys($card));
        $check = 0;
        for ($i = $min + 1; $i < $min + 5; $i++) {
            isset($card[$i]) && $check++;
        }

        //Aがある場合はもう一度チェック
        if ($check !== 4 && $min === 1) {
            $check = 0;
            for ($i = 10; $i <= 13; $i++) {
                isset($card[$i]) && $check++;
            }
        }

        //5枚連続している場合はストレート、連続していない場合は役なし
        echo $check === 4 ? "straight\n" : "null\n";

    //3カード
    } elseif ($pair === 3) {
        echo "three card\n";

    //ペアがある
    } elseif ($pair === 2) {
        //カードの種類が3種類の場合は2ペア、4種類の場合は1ペア
        echo $cnt === 3 ? "two pair\n" : "one pair\n";

    //念のため
    } else {
        echo "null\n";
    }
}