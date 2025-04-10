<?php

$DEBUG_LEVEL = 0;

main();

function main() {
	$numSets = trim(fgets(STDIN));
	$count = 0;
	while ($count < $numSets) {
		$data = getPoints();
		$adjusted = adjustAlignment($data);
		$result = calc($adjusted);
		printf("%.3f %.3f %.3f\n", round($result[0], 3), round($result[1], 3), round($result[2], 3));
		$count++;
	}
}
function getPoints() {
	$input = trim(fgets(STDIN));

	list($x1, $y1, $x2, $y2, $x3, $y3) = explode(' ', $input);

	$a = new Point($x1, $y1);
	$b = new Point($x2, $y2);
	$c = new Point($x3, $y3);

	return array($a, $b, $c);
}

function adjustAlignment($points) {
	$minKey = 0;
	$min = $points[$minKey];

	foreach ($points as $k => $p) {
		if ($min->x > $p->x) {
			$min = $p;
			$minKey = $k;
		}
	}

	unset($points[$minKey]);

	$bottom = reset($points);
	$bottomKey = key($points);
	foreach ($points as $k => $p) {
		if ($bottom->y > $p->y) {
			$bottom = $p;
			$bottomKey = $k;
		}
	}
	unset($points[$bottomKey]);

	$top = reset($points);
	$return = array($min, $bottom, $top);

	debug($return);

	return $return;
}

function calc($points) {
	$min = $points[0];
	$a = new Point(0, 0);
	$b = $points[1]->shift(-1 * $min->x, -1 * $min->y);
	$c = $points[2]->shift(-1 * $min->x, -1 * $min->y);

	debug($a . $b . $c );
	$theta = abs($b->x) > 0.00001 ? atan($b->y / $b->x) : -3.1415926535 / 2;

	debug("theta = $theta");

	$b->rotate(-$theta);
	$c->rotate(-$theta);

	debug($a . $b . $c );

	$scale = abs(1/$b->x);
	$b->scale($scale);
	$c->scale($scale);

	$x0 = $c->x;
	$y0 = $c->y;

	$gx = 1/2;
	$gy = (- $x0 + $x0*$x0 + $y0*$y0)/(2*$y0);

	$g = new Point($gx, $gy);

	$r = sqrt($g->y * $g->y + 0.5 * 0.5);
	$r *= 1/$scale;

	$g->scale(1/$scale);
	$g->rotate($theta);
	$g->shift($min->x, $min->y);

	return array($g->x, $g->y, $r);
}

class Point {

	public $x;
	public $y;

	function __construct($x, $y) {
		$this->x = $x;
		$this->y = $y;
	}

	function scale($k) {
		$this->x *= $k;
		$this->y *= $k;
		return $this;
	}

	function rotate($theta) {
		$x = $this->x;
		$y = $this->y;
		$this->x = $x * cos($theta) - $y * sin($theta);
		$this->y = $x * sin($theta) + $y * cos($theta);
		return $this;
	}

	function shift($x, $y) {
		$this->x += $x;
		$this->y += $y;
		return $this;
	}

	function __toString() {
		return sprintf("x = %.3f, y = %.3f\n", round($this->x, 3), round($this->y, 3));
	}
}

function debug($out) {
	global $DEBUG_LEVEL;
	if (!isset($DEBUG_LEVEL) || $DEBUG_LEVEL <= 0) {
		return null;
	}
	if (is_string($out)) {
		echo $out . "\n";
	} else {
		var_dump($out);
	}
}