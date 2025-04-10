<?php

main();

function main() {
	while(($n = trim(fgets(STDIN))) != -1) {
		$hunter = new TreasureHunter(1, 0);
		$hunter->findTreasure($n);
	}

}

class TreasureHunter {

	/**
	 *
	 * @var Point $p
	 */
	public $p;

	public function __construct($x, $y) {
		$this->p = new Point($x, $y);
	}

	public function step() {
		$this->p->toWill();
		$this->p->rotateR();
		$this->p->move();
		//echo $this->p;
	}

	public function findTreasure($n) {
		for ($i = 0; $i < $n - 1; $i++) {
			$this->step();
		}
		$this->sayPosition();
	}

	public function sayPosition() {
		echo $this->p->x . "\n";
		echo $this->p->y . "\n";
	}

}

class Point {
	public $x;
	public $y;
	public $vx;
	public $vy;

	public function __construct($x, $y) {
		$this->x = $x;
		$this->y = $y;
	}

	public function rotateR() {
		$vx = $this->vx;
		$vy = $this->vy;
		$this->vx = $vy;
		$this->vy = -$vx;
	}

	public function toWill() {
		$this->vx = -$this->x;
		$this->vy = -$this->y;
		$this->normalize();
	}

	public function move() {
		$this->x += $this->vx;
		$this->y += $this->vy;
	}

	private function normalize() {
		$v = $this->v();
		if ($v == 0) {
			$this->vx = 1;
			$this->vy = 0;
			return;
		}
		$this->vx /= $v;
		$this->vy /= $v;
	}

	private function v() {
		return sqrt($this->vx * $this->vx + $this->vy * $this->vy);
	}

	public function __toString() {
		return "(x, y, vx, vy) = ({$this->x}, {$this->y}, {$this->vx}, {$this->vy})\n";
	}
}