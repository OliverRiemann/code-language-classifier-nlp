<?php

class Node {
	public $left;
	public $right;
	public $value;
	public $largest;

	public function __construct($value) {
		$this->value = $value;
	}

	public function max_value() {
		if ($this->largest !== null) {
			return $this->largest;
		}
		if (is_null($this->left) && is_null($this->right)) {
			return $this->value;
		}
		$left  = is_null($this->left)  ? -1 : $this->left->max_value();
		$right = is_null($this->right) ? -1 : $this->right->max_value();

		return $this->largest = $this->value + max($left, $right);
	}
}

$diamond = array();

while ($line = trim(fgets(STDIN))) {
	$diamond[] = explode(',', $line);
}

$nodes = array();
for ($i = 0; $i < count($diamond); $i++) {
	for ($j = 0; $j < count($diamond[$i]); $j++) {
		$nodes[$i][$j] = new Node($diamond[$i][$j]);
	}
}

for ($i = 0; $i < count($nodes); $i++) {
	for ($j = 0; $j < count($nodes[$i]); $j++) {
		$n = $nodes[$i][$j];
		if ($i < count($diamond)/2 - 1) {
			$n->left  = isset($nodes[$i + 1][$j])     ? $nodes[$i + 1][$j]     : null;
			$n->right = isset($nodes[$i + 1][$j + 1]) ? $nodes[$i + 1][$j + 1] : null;
		} else {
			$n->left  = isset($nodes[$i + 1][$j - 1]) ? $nodes[$i + 1][$j - 1] : null;
			$n->right = isset($nodes[$i + 1][$j])     ? $nodes[$i + 1][$j]     : null;
		}
	}
}

$top = $nodes[0][0];

echo $top->max_value() . "\n";