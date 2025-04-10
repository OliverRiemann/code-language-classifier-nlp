<?php
class PriorityQueue extends SplPriorityQueue{
  public function compare($priority1, $priority2){
    if ($priority1 === $priority2) return 0;
    return $priority1 < $priority2 ? 1 : -1;
  }
}
$fp = fopen("php://stdin","r");

while(true){
  fscanf( $fp, "%d %d", $n, $m);
  if($n == 0 && $m == 0) break;
  for($i = 0 ; $i <= $n ; $i++ ){
    for($j = 0 ; $j < 2 ; $j++ ){
      $used[$i][$j] = false;
      $min_cost[$i][$j] = 10000000;
    }
  }
  $info = array();
  for($i = 0 ; $i < $m ; $i++){
    fscanf( $fp, "%d %d %d", $a, $b, $c);
    $info[$a][] = array($b,$c);
    $info[$b][] = array($a,$c);
  }
  $que = new PriorityQueue();
  $que -> setExtractFlags(PriorityQueue::EXTR_BOTH);
  $que -> insert(array(1,0),0);
  while(!$que -> isEmpty()){
    $que -> top();
    $pair = $que -> extract();
    $cost = $pair['priority'];
    $now = $pair['data'][0];
    $ticket = $pair['data'][1];
    if($now == $n){
      print($cost."\n");
      break;
    }
    if($used[$now][$ticket]) continue;
    $used[$now][$ticket] = true;
    for($i = 0 ; $i < count($info[$now]) ; $i++){
      $e = $info[$now][$i];
      if($cost + $e[1] < $min_cost[$e[0]][$ticket]){
        $min_cost[$e[0]][$ticket] = $cost + $e[1];
        $que -> insert(array($e[0],$ticket),$cost + $e[1]);
      }
      if($ticket == 0){
        for($j = 0 ; $j < count($info[$e[0]]) ; $j++ ){
          $ee = $info[$e[0]][$j];
          if($cost < $min_cost[$ee[0]][1]){
            $min_cost[$ee[0]][1] = $cost;
            $que -> insert(array($ee[0],1),$cost);
          }
        }
      }
    }
  }
}
?>