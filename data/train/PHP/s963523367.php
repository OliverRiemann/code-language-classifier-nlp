<?php

main();

function main() {
	$points = array();
	while ($line = trim(fgets(STDIN))) {
		list($x, $y) = explode(',', $line);
		$points[] = new Point($x, $y);
	}
	$sum = 0;
	$o = $points[0];
	for ($i = 1; $i < count($points) - 1; $i++) {
		$p1 = $points[$i];
		$p2 = $points[$i+1];

		$T = new Triangle($o, $p1, $p2);
		$sum += $T->getArea();
	}
	echo $sum . "\n";
}

class Triangle {
	public $A, $B, $C;
	public $a, $b, $c;

	public function __construct(Point $A, Point $B, Point $C) {
		$this->A = $A;
		$this->B = $B;
		$this->C = $C;

		$this->a = $B->distanceFrom($C);
		$this->b = $C->distanceFrom($A);
		$this->c = $A->distanceFrom($B);
	}

	public function getArea() {
		$z = ($this->a + $this->b + $this->c) / 2;
		return sqrt($z * ($z - $this->a) * ($z - $this->b) * ($z - $this->c));
	}
}

class Point {
	public $x, $y;

	public function __construct($x, $y) {
		$this->x = $x;
		$this->y = $y;
	}

	public function distanceFrom(Point $p) {
		$dx = $this->x - $p->x;
		$dy = $this->y - $p->y;
		return sqrt($dx * $dx + $dy * $dy);
	}
}