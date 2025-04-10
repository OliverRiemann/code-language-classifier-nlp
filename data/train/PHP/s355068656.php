<?php
while (!feof(STDIN)) {
  $stdin = trim(fgets(STDIN));
  $values  = explode(',', $stdin);
  if (count($values) != 5) {
  } else {
    $temp = array();
    foreach ($values as $value) {
      if (!isset($temp[$value])) {
        $temp[$value] = 1;
      } else {
        $temp[$value]++;
      }
    }
    ksort($temp);
    $ret = 'null';
    foreach ($temp as $t) {
      if ($t == 4) {
        $ret = 'four card';
      } elseif ($t == 3) {
        if ($ret == 'one pair') {
          $ret = 'full house';
        } else {
          $ret = 'three card';
        }
      } elseif ($t == 2) {
        if ($ret == 'one pair') {
          $ret = 'two pair';
        } elseif ($ret == 'three card') {
          $ret = 'full house';
        } else {
          $ret = 'one pair';
        }
      }
    }
    $temp = array_keys($temp);
    if (count($temp) == 5 && $temp[4] - $temp[0] == 4) {
      $ret = 'straight';
    }
    // 1???13????????´
    $temp2 = array();
    foreach ($temp as $t) {
      if ($t == 1) {
        $temp2[] = 14;
      } else {
        $temp2[] = $t;
      }
    }
    sort($temp2);
    if (count($temp2) == 5 && $temp2[4] - $temp2[0] == 4) {
      $ret = 'straight';
    }
    echo $ret . "\n";
  }
}

