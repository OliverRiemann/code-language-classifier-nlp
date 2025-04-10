<?php
  const DIRS = "RDLU";
  $p = array(1,0,0);
  $path = array('R');
  $stepx =  array(1,0,-1,0);
  $stepy = array(0,1,0,-1);

  function frontIsClear($x,$y,$d,$l) {
      return ($d == 0 && ($y>0 ? !$l[2*$y-1][$x] : 1)) || ($d == 1 && ($x<4 ? !$l[2*$y][$x] : 1))
          || ($d == 2 && ($y<4 ? !$l[2*$y+1][$x] : 1)) || ($d == 3 && ($x>0 ? !$l[2*$y][$x-1] : 1));
  }

  function canMove($x,$y,$d,$l) {
      return ($d==0 && $x!=4 && $l[2*$y][$x]) || ($d==1 && $y!=4 && $l[2*$y+1][$x])
          || ($d==2 && $x!=0 && $l[2*$y][$x-1]) || ($d==3 && $y!=0 && $l[2*$y-1][$x]);
  }

  function move(&$p,$stepx,$stepy) {
      if($p[2] == 0 || $p[2] == 2)
          $p[0] = $p[0] + $stepx[$p[2]];
      else
          $p[1] = $p[1] + $stepy[$p[2]];
  }

  for($i=0;$i<9;$i++)
      $l[] = trim(fgets(STDIN));

  while(true) {
       if(!frontIsClear($p[0],$p[1],$p[2],$l)){
          $p[2] = ($p[2]+3) % 4;
       } else {
           while(!canMove($p[0],$p[1],$p[2],$l))
              $p[2] = ($p[2]+1) % 4;
       }
       if($p == array(0,0,0))
           break;
       move($p,$stepx,$stepy);
       $path[] = DIRS[$p[2]];
  }

  echo implode('',$path).PHP_EOL;