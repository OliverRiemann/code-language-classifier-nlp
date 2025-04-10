<?php

class PQ extends SplPriorityQueue
{
        public function compare($priority1, $priority2)
        {
                if ($priority1 === $priority2) return 0;
                return $priority1 > $priority2 ? -1 : 1;
        }
}

$n=trim(fgets(STDIN));
$m=trim(fgets(STDIN));
$cost=[];
for ($i=0; $i < $m; $i++) {
        list($a,$b,$c,$d)=explode(',',trim(fgets(STDIN)));
        $a--;$b--;
        $cost[$a][$b]=$c;
        $cost[$b][$a]=$d;
}
list($x1,$x2,$y1,$y2)=explode(',',trim(fgets(STDIN)));
$x1--;$x2--;

$y1-=$y2;

$que=new PQ();
$que->insert($x1,0);

$expense=array_fill(0,$n,PHP_INT_MAX/6);
$expense[$x1]=0;

while($que->count()){
        $now=$que->extract();
        if ($now===$x2) {
                break;
        }
        foreach ($cost[$now] as $next => $v) {
                if ($expense[$next]>$expense[$now]+$cost[$now][$next]) {
                        $expense[$next]=$expense[$now]+$cost[$now][$next];
                        $que->insert($next,$expense[$next]);
                }
        }
}

$y1-=$expense[$x2];

$que=new PQ();
$que->insert($x2,0);

$expense=array_fill(0,$n,PHP_INT_MAX/6);
$expense[$x2]=0;

while($que->count()){
        $now=$que->extract();
        if ($now===$x1) {
                break;
        }
        foreach ($cost[$now] as $next => $v) {
                if ($expense[$next]>$expense[$now]+$cost[$now][$next]) {
                        $expense[$next]=$expense[$now]+$cost[$now][$next];
                        $que->insert($next,$expense[$next]);
                }
        }
}

$y1-=$expense[$x1];

echo $y1.PHP_EOL;