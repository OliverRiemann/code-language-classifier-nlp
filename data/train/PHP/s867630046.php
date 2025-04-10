<?php

    while(true){
        if (!choiceBankFromDataSet()) {
            break;
        }
    }
    exit;

    function choiceBankFromDataSet()
    {
        $s = trim(fgets(STDIN));
        $s = str_replace(array("\r\n","\r","\n"), '', $s);
        // ????????°
        $bankNum = (int)$s;
    
        if ($bankNum == 0) {
            return false;
        }
    
        $s = trim(fgets(STDIN));
        $s = str_replace(array("\r\n","\r","\n"), '', $s);
        $year = (int)$s;
    
        $bankInfo;
        $benefitTemp = 0;
        $benefitMax  = 0;
        $bestBankId;
        
        for ( $i = 0; $i < $bankNum; $i++) {
            $s = trim(fgets(STDIN));
            $s = str_replace(array("\r\n","\r","\n"), '', $s);
            $a = explode(" ", $s);
            $bankInfo = array('bank_id' => intval($a[0]), 'interest_rate' => intval($a[1]), 'interest_kind' => intval($a[2]));
            $benefitTemp = calcBenefit($year, $bankInfo);
            if ($benefitMax < $benefitTemp) {
                $benefitMax = $benefitTemp;
                $bestBankId = $bankInfo['bank_id'];
            }
        }
        
        echo($bestBankId . PHP_EOL);
        return true;
    }
    
    function calcBenefit($year, $bankInfo){
        $doller = 10000000;
        // ??????
        if ($bankInfo['interest_kind'] == 1) {
            $benefit = $doller * (1 + $year * $bankInfo['interest_rate'] / 100);
        } else {
            $benefit = $doller * pow((1 + $bankInfo['interest_rate'] / 100), $year);
        }
        return $benefit;
    }
?>