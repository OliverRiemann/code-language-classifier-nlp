<?php
class AOJ0534 {
    var $T;
    var $TC;
    var $L;
    var $LC;

    public function init() {
        $L = &$this->L;
        $LC = &$this->LC;
        $T = &$this->T;
        $TC = &$this->TC;
        
        $in = file_get_contents('/dev/stdin');
        $L = explode( "\n", trim($in) );
        $LC = count($L);
        $T = array();
        $TC = 0;
    }
    
    public function input() {
        $L = &$this->L;
        $LC = &$this->LC;
        $T = &$this->T;
        $TC = &$this->TC;
        
        for ( $i = 0; $i < $LC; ++ $i ) {
            if ( $L[$i] == "0" ) break;
            $n = $L[$i++];
            $T[$TC] = array();
            for ( $j = 0; $j < $n; ++ $j ) {
                $T[$TC][] = intval($L[$i++]);
            }
            $TC++;
            $i--;
        }
    }

    public function check($s) {
        for ( $i = 1; $i <= 3; ++ $i ) {
            $key = str_repeat( $i, 4 );
            if ( strstr( $s, $key ) ) return true;
        }
        return false;
    }

    public function calc($s) {
        while ( $this->check($s) ) {
            for ( $i = 1; $i <= 3; ++ $i ) {
                $regexp = "/".$i."{4,}/";
                $s = preg_replace( $regexp, '', $s );
            }
        }
        return $res = strlen($s);
    }

    public function check_around( $s, $k ) {
        $res = 0;
        $n = strlen($s);
        for ( $i = 0; $i < 4; ++ $i ) {
            $id = $k - $i - 1;
            if ( $id < 0 ) break;
            if ( $s[$k] != $s[$id] ) break;
            $res ++;
        }
        for ( $i = 0; $i < 4; ++ $i ) {
            $id = $k + $i + 1;
            if ( $id >= $n ) break;
            if ( $s[$k] != $s[$id] ) break;
            $res ++;
        }
        return $res + 1;
    }
    
    public function solve($s_) {
        $res = PHP_INT_MAX;
        $s = implode('', $s_);
        for ( $i = 1; $i <= 3; ++ $i ) {
            $regexp = "/".$i."{4,}/";
            $s = preg_replace( $regexp, str_repeat($i, 4), $s );
        }
        $n = strlen($s);
        for ( $i = 0; $i < $n; ++ $i ) {
            $t = $s;
            for ( $j = 1; $j <= 3; ++ $j ) {
                if ( $t[$i] == $j ) continue;
                $t[$i] = $j;
                if ( $this->check_around( $t, $i ) < 4 ) continue;
                if ( ( $i-1 >= 0 && $t[$i-1] == $j ) || ( $i+1 < $n && $t[$i+1] == $j ) ) {
                    $res = min( $res, $this->calc($t) );
                }
            }
        }
        return $res;
    }
    
    public function run() {
        $this->init();
        $this->input();
        foreach ( $this->T as $test ) {
            echo $this->solve($test)."\n";
        }
    }
}

$instance = new AOJ0534;
$instance->run();