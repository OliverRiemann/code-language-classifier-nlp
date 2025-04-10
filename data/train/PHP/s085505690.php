<?php

define( 'NONE', -1 );

class AOJ1031 {
    var $L;
    var $LC;
    var $n;
    var $X;
    var $Y;

    public function init() {
        $L = &$this->L;
        $LC = &$this->LC;
        
        $L = file( '/dev/stdin' );
        $LC = count( $L );
    }

    public function input( &$offset ) {
        $L = &$this->L;
        $LC = &$this->LC;
        $n = &$this->n;
        $markup = &$this->markup;
        $X = &$this->X;
        $Y = &$this->Y;

        $n = $L[$offset];
        if ( $n == 0 ) return false;
        
        $markup = $L[$offset+1];
        $offset += 2;
        $X = array();
        $Y = array();
        for ( $i = 0; $i < $n; ++ $i, ++ $offset ) {
            $line = $L[$offset];
            $terms = split(' ', $line);
            $X[$i] = intval( $terms[0] );
            $Y[$i] = intval( $terms[1] );
        }
        return true;
    }

    public function hit_test( $x, $y, $x1, $y1, $x2, $y2 ) {
        return $x1 <= $x && $x <= $x2 && $y1 <= $y && $y <= $y2;
    }

    public function get_positions( $line, &$x1, &$y1, &$x2, &$y2 ) {
        $terms = split( ',', $line );
        $x1 = $terms[0];
        $y1 = $terms[1];
        $x2 = $terms[2];
        $y2 = $terms[3];
    }

    public function check_clicked( $root, $x, $y, &$name, &$childs ) {
        $this->get_positions( $root, $x1, $y1, $x2, $y2 );
        if ( $this->hit_test( $x, $y, $x1, $y1, $x2, $y2 ) ) {
            foreach ( $root as $child ) {
                $this->get_positions( $child, $x1, $y1, $x2, $y2 );
                if ( $this->check_clicked( $child, $x, $y, $name, $childs ) ) {
                    return true;
                }
            }
            $name = $root->getName();
            $childs = $root->count();
            return true;
        }
        $name = 'OUT OF MAIN PANEL';
        $childs = 1;
        return false;
    }

    public function solve() {
        $n = &$this->n;
        $markup = &$this->markup;
        $X = &$this->X;
        $Y = &$this->Y;

        $object = new SimpleXMLElement( $markup );
        for ( $i = 0; $i < $n; ++ $i ) {
            $name = "";
            $childs = -1;
            $this->check_clicked( $object, $X[$i], $Y[$i], $name, $childs );
            echo "$name $childs\n";
        }
    }

    public function run() {
        $L = &$this->L;
        $LC = &$this->LC;
        $this->init();
        for ( $i = 0; $i < $LC; ++ $i ) {
            while ( $this->input($i) ) {
                $this->solve();
            }
        }
    }
}

$instance = new AOJ1031;
$instance->run();