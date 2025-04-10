<?php

$tokens = array();
$cnt = 0;

// 変数表
$variables = array();

main();

function main() {
	global $tokens, $cnt;
	$n = trim(fgets(STDIN));
	for ($i = 0; $i < $n; $i++) {
		try {
			$cnt = 0;
			//echo "$ ";
			$input = trim(fgets(STDIN));
			$tokens = tokenize($input);
			// 代入文か、式か？
			if (is_assignment()) {
				assign();
			} else {
				$tree = expression();
				echo $tree->evaluate() . "\n";
			}
		} catch (SyntaxErrorException $e) {
			echo $e->getMessage() . "\n";
			$tokens = array();
			$cnt = 0;
		} catch (UndefinedVariableException $e) {
			echo $e->getMessage() . "\n";
			$tokens = array();
			$cnt = 0;
		}
	}
}

function tokenize($line) {
	$line = str_replace(' ', '', $line);
	preg_match_all("@([0-9]+|\+|\-|\*|/|\(|\))@", $line, $tokens);
	if (!is_array($tokens)) {
		return array();
	}
	return $tokens[0];
}

function is_assignment() {
	global $tokens;
	// 代入にはトークンが少なくとも3つ必要
	if (count($tokens) < 3) {
		return false;
	}
	$t0 = $tokens[0];
	$t1 = $tokens[1];
	if (is_string($t0) && $t1 === '=') {
		return true;
	} else {
		return false;
	}
}

function assign() {
	global $variables, $tokens, $cnt;
	$var = $tokens[0];
	$cnt += 2; // '=' を読み飛ばす。
	$exp = expression();
	$variables[$var] = is_object($exp) ? $exp->evaluate() : null;

}

function expression() {
	global $tokens, $cnt;
	if (empty($tokens)) {
		die("tokens are empty\n");
	}

	$node = term();

	while (true) {
		if ($cnt >= count($tokens)) {
			break;
		}
		$next = $tokens[$cnt];
		if ($next === '+'|| $next === '-') {
			$cnt++;
			$node = new Node($next, $node, term());
		} else {
			break;
		}
	}
	return $node;
}

function term() {
	global $tokens, $cnt;

	$node = factor();

	while (true) {
		if ($cnt >= count($tokens)) {
			break;
		}
		$next = $tokens[$cnt];
		if ($next === '*' || $next === '/') {
			$cnt++;
			$node = new Node($next, $node, factor());
		} else {
			break;
		}
	}
	return $node;
}

function factor() {
	global $variables, $tokens, $cnt;

	$next = $tokens[$cnt];

	// カッコがきたらその中にはexpressionがある。
	if ($next === '(') {
		$cnt++; // 左カッコを読み飛ばす
		$node = expression();
		if ($tokens[$cnt++] !== ')') { // 右括弧を読み飛ばす
			throw new SyntaxErrorException("カッコが閉じていない");
		}
		return $node;
	}
	// カッコでなければ数か変数として評価
	// 数
	elseif (is_numeric($next)) {
		$cnt++;
		return new Node(intval($next));
	}
	// 変数
	elseif (is_string($next)) {
		if (isset($variables[$next])) {
			$cnt++;
			return new Node($variables[$next]);
		}
		throw new UndefinedVariableException("Undefined variable: " . $next);
	} else {
		throw new SyntaxErrorException("Syntax error 2.\n");
	}
}

class Node {

	public $value;
	public $left;
	public $right;

	public function __construct($value = null, $left = null, $right = null) {
		$this->value = $value;
		$this->left = $left;
		$this->right = $right;
	}

	public function evaluate() {
		if (is_numeric($this->value) || $this->value === null) {
			return intval($this->value);
		}

		if ($this->left && $this->right) {
			$left = $this->left->evaluate();
			$right = $this->right->evaluate();
			$op = $this->value;
			switch ($op) {
				case '+':
					return $left + $right;
				case '-':
					return $left - $right;
				case '*':
					return $left * $right;
				case '/':
					return intval($left / $right);
				default:
					throw new SyntaxErrorException("不明な演算子：$op");
			}

		}

		throw new SyntaxErrorException("evaluate: ツリー構造がおかしい");
	}


	public function show($depth = 0) {
		$return = "";

		$left  = is_a($this->left,  "Node") ? "\n" . $this->left->show($depth + 1)  : $this->left;
		$right = is_a($this->right, "Node") ? "\n" . $this->right->show($depth + 1) : $this->right;

		$return .= $this->space($depth) . "value = {$this->value}\n";
		$return .= $this->space($depth) . "left  = {$left}\n";
		$return .= $this->space($depth) . "right = {$right}\n";


		return $return;
	}

	private function space($depth) {
		$space = "";
		for ($i = 0; $i < $depth * 4; $i++) {
			$space .= " ";
		}
		return $space;
	}
}

class SyntaxErrorException extends Exception {}
class UndefinedVariableException extends RuntimeException {}