<?php

fscanf(STDIN, "%d", $N);
for ($i = 0; $i < $N; $i++) {
    fscanf(STDIN, "%s", $a);
    fscanf(STDIN, "%s", $b);
    $x = new BigInt();
    if (!$x->setNum($a)) {
        echo 'overflow' . PHP_EOL;
        continue;
    }
    $y = new BigInt();
    if (!$y->setNum($b)) {
        echo 'overflow' . PHP_EOL;
        continue;
    }
    $total = $x->add($y);
    if ($total === NULL) {
        echo 'overflow' . PHP_EOL;
        continue;
    }
    echo $total;
    echo PHP_EOL;
}

class BigInt
{
    const PLACE = 18;
    public $num = array();
    public $maxLen;
    private $zero;

    public function __construct($maxLen = 80) {
        $this->maxLen = $maxLen;
        $n = ceil($maxLen / self::PLACE);
        for ($i = 0; $i < $n; $i++) {
            $this->num[] = '';
        }
        $this->zero = implode(array_fill(0, self::PLACE, '0'));
    }

    public function setNum($num) {
        if (strlen($num) > $this->maxLen) {
            return FALSE;
        }
        $n = ceil($this->maxLen / self::PLACE);
        for ($i = 0; $i < $n; $i++) {
            if (strlen($num) <= self::PLACE) {
                $this->num[$i] = implode(array_fill(0, self::PLACE - strlen($num), '0')) . $num;
                break;
            }
            $this->num[$i] = substr($num, - self::PLACE);
            $num = substr($num, 0, strlen($num) - self::PLACE);
        }
        return TRUE;
    }

    public function add(BigInt $a) {
        $num = $this->num;
        $n = ceil($this->maxLen / self::PLACE);
        $up = 0;
        for ($i = 0; $i < $n; $i++) {
            $num[$i] = (int) $num[$i] + (int) $a->num[$i] + $up;
            if ($num[$i] > 0) {
                $num[$i] = (string) $num[$i];
            } else {
                $num[$i] = $this->zero;
            }
            if (strlen($num[$i]) > self::PLACE) {
                $num[$i] = substr($num[$i], - self::PLACE);
                $up = 1;
            } elseif (strlen($num[$i]) < self::PLACE) {
                $num[$i] = implode(array_fill(0, self::PLACE - strlen($num[$i]), '0')) . $num[$i];
                $up = 0;
            }
        }
        $total = '';
        for ($i = $n - 1; $i >= 0; $i--) {
            $total .= $num[$i];
        }
        $total = preg_replace('/^0*/', '', $total);
        if ($total === '') {
            $total = '0';
        }
        if (strlen($total) > $this->maxLen) {
            return NULL;
        }
        return $total;
    }
}