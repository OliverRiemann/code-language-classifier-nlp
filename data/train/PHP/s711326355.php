<?php
$templete = array(
    '(%d %s %d %s %d) %s %d',
    '((%d %s %d) %s %d) %s %d',
    '(%d %s (%d %s %d)) %s %d',
    '(%d %s %d) %s %d %s %d',
    '(%d %s %d) %s (%d %s %d)',
    '%d %s (%d %s %d %s %d)',
    '%d %s ((%d %s %d) %s %d)',
    '%d %s (%d %s %d) %s %d',
    '%d %s %d %s (%d %s %d)',
    '%d %s %d %s %d %s %d',
);
$operators = array(
    '+ + +',
    '+ + -',
    '+ + *',
    '+ - +',
    '+ - -',
    '+ - *',
    '+ * +',
    '+ * -',
    '+ * *',
    '- + +',
    '- + -',
    '- + *',
    '- - +',
    '- - -',
    '- - *',
    '- * +',
    '- * -',
    '- * *',
    '* + +',
    '* + -',
    '* + *',
    '* - +',
    '* - -',
    '* - *',
    '* * +',
    '* * -',
    '* * *',
);
while($line = trim(fgets(STDIN))){
    if($line == '0 0 0 0'){
        break;
    }
    $data_ary = explode(" ",$line);
    foreach($templete as $temp){
        $flg = false;
        if(getAnswer($data_ary,$operators,$temp)){
            $flg = true;
            break;
        }
    }
    if(!$flg){
        echo "0\n";
    }
}
function getAnswer($data_ary,$opes,$temp){
    for($a = 0;$a < 4;$a++){
        for($b = 0;$b < 4;$b++){
            if($a != $b){
                for($c = 0;$c < 4;$c++){
                    if($a != $b && $b != $c && $a != $c){
                        for($d = 0;$d < 4 ;$d++){
                            if($a != $b && $b != $c && $c != $d && $a != $c && $a != $d && $b != $d){
                                foreach($opes as $ope){
                                    $op = explode(" ",$ope);
                                    $math = sprintf($temp,$data_ary[$d],$op[0],$data_ary[$c],$op[1],$data_ary[$b],$op[2],$data_ary[$a]);
                                    eval('$ans = '.$math.';');
                                    if($ans == 10){
                                        echo "(".$math.")\n";
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return false;
}
