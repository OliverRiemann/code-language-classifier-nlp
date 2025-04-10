<?php
fscanf ( STDIN, '%d', $rowcnt );

for($row = 0; $row < $rowcnt; $row ++) {
	$dataset = explode ( ' ', rtrim ( fgets ( STDIN ) ) );
	$result = pushBall ( $dataset );
	if ($result) {
		echo "YES";
	} else {
		echo "NO";
	}
	echo PHP_EOL;
}
function pushBall($dataset) {
	$b = new Tube ();
	$c = new Tube ();

	foreach ( $dataset as $n ) {
		if ($b->isPushable ( $n ) && $c->isPushable ( $n )) {
			if ($b->peek () < $c->peek ()) {
				$c->push ( $n );
			} else {
				$b->push ( $n );
			}
		} else if ($b->isPushable ( $n )) {
			$b->push ( $n );
		} else if ($c->isPushable ( $n )) {
			$c->push ( $n );
		} else {
			return false;
		}
	}
	return true;
}
class Tube {
	private $tube = [ ];
	public function __construct() {
		$this->tube [] = 0;
	}
	public function isPushable($n) {
		if ($this->peek () < $n) {
			return true;
		} else {
			return false;
		}
	}
	public function push($n) {
		$this->tube [] = $n;
	}
	public function peek() {
		$idxLast = count ( $this->tube ) - 1;
		return $this->tube [$idxLast];
	}
}