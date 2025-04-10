<?php

$map = array(
	'a' => 0,
	'b' => 1,
	'c' => 2,
	'd' => 3,
	'e' => 4,
	'f' => 5,
	'g' => 6,
	'h' => 7,
	'i' => 8,
	'j' => 9,
	'k' =>10,
	'l' =>11,
	'm' =>12,
	'n' =>13,
	'o' =>14,
	'p' =>15,
	'q' =>16,
	'r' =>17,
	's' =>18,
	't' =>19,
	'u' =>20,
	'v' =>21,
	'w' =>22,
	'x' =>23,
	'y' =>24,
	'z' =>25,
);

$rev_map = array_flip($map);

$n = trim(fgets(STDIN));

for ($i = 0; $i < $n; $i++) {
	$line = trim(fgets(STDIN));
	echo solve($line) . "\n";
}


function solve($line) {
	$words = explode(' ', $line);
	foreach ($words as $w) {
		if (strlen($w) != 4) {
			continue;
		}
		for ($a = 1; $a < 26; $a++) {
			for ($b = 0; $b < 26; $b++) {
				if (encrypt($a, $b, 'that') == $w || encrypt($a, $b, 'this') == $w) {
					return decrypt($a, $b, $line);
				}
			}
		}
	}
}

function decrypt($a, $b, $line) {
	$decrypt_map = generate_decrypt_map($a, $b);
	$dec = '';
	for ($i = 0; $i < strlen($line); $i++) {
		$char = $line[$i];
		if (preg_match('/[a-z]/', $char)) {
			$dec .= $decrypt_map[$char];
		} else {
			$dec .= $char;
		}
	}
	return $dec;
}

function generate_decrypt_map($a, $b) {
	global $map;
	$result = array();
	foreach ($map as $k => $c) {
		$result[$k] = encrypt_char($a, $b, $k);
	}
	return array_flip($result);
}


function encrypt($a, $b, $w) {
	$result = '';
	for($i = 0; $i < strlen($w); $i++) {
		$result .= encrypt_char($a, $b, $w[$i]);
	}
	return $result;
}

function encrypt_char($a, $b, $char) {
	global $map, $rev_map;
	$g = $map[$char];
	$enc = ($a * $g + $b) % 26;
	return $rev_map[$enc];
}