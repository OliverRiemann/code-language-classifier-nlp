<?php
/*
  AOJ 0598
  Title:JOI Emblem
  @kankichi573
*/
$result=array();
$hata=array();
$template=array();

fscanf(STDIN,"%d %d",$m,$n);

for($i=0;$i<$m;$i++)
  fscanf(STDIN,"%s",$hata[$i]);
for($i=0;$i<2;$i++)
  fscanf(STDIN,"%s",$template[$i]);
$cnt4=0;


for($i=0;$i<$m-1;$i++)
  for($j=0;$j<$n-1;$j++)
    {
      $cnt=0;
      for($k=0;$k<2;$k++)
	for($l=0;$l<2;$l++)
	  $cnt+=(substr($hata[$i+$k],$j+$l,1)==substr($template[$k],$l,1))?1:0;
      
      if($cnt==4)
	$cnt4++;
      if($cnt==3)
	{
	for($k=0;$k<2;$k++)
	  for($l=0;$l<2;$l++)
	    if(substr($hata[$i+$k],$j+$l,1)!=substr($template[$k],$l,1))
	      {
		if(isset($result[$i+$k][$j+$l][substr($template[$k],$l,1)]))
		  $result[$i+$k][$j+$l][substr($template[$k],$l,1)]++;
		else
		  $result[$i+$k][$j+$l][substr($template[$k],$l,1)]=1;
	      }
	}
    }

$max=0;
foreach ($result as $key1 => $val1)
{
  foreach ($val1   as $key2 => $val2)
    {
      foreach($val2 as $key3 => $val3)
	{
	  $max = max($max,$val3);
	}
    }
}

printf("%d\n",$cnt4+$max);

return(0);

?>