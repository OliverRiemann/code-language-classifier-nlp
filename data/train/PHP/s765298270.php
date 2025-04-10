<?php
// AOJ 0121
// @kankichi573
// 2014/6/22 P.E
$a=array(0,1,2,3,4,5,6,7);
$tesuu=array(0);

function swap($a,$pos,$offset)
{
	$wk=$a[$pos];
	$a[$pos]=$a[$pos+$offset];
	$a[$pos+$offset]=$wk;
	return($a);
}


function prepare($a,$te,$pos) 
 { 
   global $tesuu;

   //echo implode($a).": $te \n";
   if($te>40)
     return;
   //$pos=search_zero($a); 
   if(($pos % 4) < 3) 
     {	 
       $b=$a;
       $b=swap($b,$pos,1);
       $mystring=implode($b);	
       if(empty($tesuu[$mystring]) || 
	  $tesuu[$mystring] > $te)
	    {
	      $tesuu[$mystring] = $te+1;	
	      prepare($b,$te+1,$pos+1);
	    }
     }
   
   if(($pos % 4) > 0)
     {	
       $b=$a;
       $b=swap($b,$pos,-1);
       $mystring=implode($b);	
       if(empty($tesuu[$mystring]) || 
	  $tesuu[$mystring] > $te)
	 {
	   $tesuu[$mystring] = $te+1;
	   prepare($b,$te+1,$pos-1);
	 }
     }		
   if($pos > 3)
     {	
       $b=$a;
       $b=swap($b,$pos,-4);
       $mystring=implode($b);	
       if(empty($tesuu[$mystring]) || 
	       $tesuu[$mystring] > $te)
	 {
	   $tesuu[$mystring] = $te+1;
	   prepare($b,$te+1,$pos-4);
	 }
     }		
   if($pos < 4)
     {	
       $b=$a;
       $b=swap($b,$pos,4);
       $mystring=implode($b);	
       if(empty($tesuu[$mystring]) || 
	  $tesuu[$mystring] > $te)
	 {
	   $tesuu[$mystring] = $te+1;
	   prepare($b,$te+1,$pos+4);
	 }
     }
 }

$tesuu[implode($a)]=1;
prepare($a,1,0);
while($input=fscanf(STDIN,"%d %d %d %d %d %d %d %d"))
  {
    //echo "input=>".implode($input)."\n";
    fprintf(STDOUT,"%d\n",$tesuu[implode($input)]-1);
  }
  return(0);
?>