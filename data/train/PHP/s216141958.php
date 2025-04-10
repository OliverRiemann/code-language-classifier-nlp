<?php
  const DIRS = array('R','D','L','U');
  $p = array(1,0,0);
  $path = 'R';
  $step =  array(array(1,0), array(0,1), array(-1,0), array(0,-1));

  function frontIsClear($p, $l) {
      list($x,$y,$d) = $p;
      return ($d == 0 && ($y>0 ? !$l[2*$y-1][$x] : 1))
             || ($d == 1 && ($x<4 ? !$l[2*$y][$x] : 1))
             || ($d == 2 && ($y<4 ? !$l[2*$y+1][$x] : 1))
             || ($d == 3 && ($x>0 ? !$l[2*$y][$x-1] : 1));
  }

  function canMove($p,$l) {
      list($x,$y,$d) = $p;
      switch($p[2]) {
      case 0:
          return $x!=4 && $l[2*$y][$x];
      case 1:
          return $y!=4 && $l[2*$y+1][$x];
      case 2:
          return $x!=0 && $l[2*$y][$x-1];
      case 3:
          return $y!=0 && $l[2*$y-1][$x];
      }
  }

  function move(&$p,$step) {
      $p[0] = $p[0] + $step[$p[2]][0];
      $p[1] = $p[1] + $step[$p[2]][1];
  }

  for($i=0;$i<9;$i++)
      $l[] = trim(fgets(STDIN));

  while(true) {
       if(!frontIsClear($p,$l)){
          $p[2] = ($p[2]+3) % 4;
       } else {
           while(!canMove($p,$l)) {
              $p[2] = ($p[2]+1) % 4;
           }
       }
       if($p == array(0,0,0))
           break;
       move($p,$step);
       $path .= DIRS[$p[2]];
  }

  echo $path.PHP_EOL;