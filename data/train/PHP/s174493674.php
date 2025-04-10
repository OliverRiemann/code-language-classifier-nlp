<?php

while ($line = trim(fgets(STDIN))) {
	$hand = explode(',', $line);
	sort($hand);
	$group = array();
	foreach ($hand as $n) {
		$group[$n] = isset($group[$n]) ? $group[$n] + 1 : 1;
	}
	sort($group);
	$max = max($group);
	if (isFourCard($max)) {
		echo "four card\n";
		continue;
	}
	if (isFullHouse($group)) {
		echo "full house\n";
		continue;
	}
	if (isStraight($hand)) {
		echo "straight\n";
		continue;
	}
	if (isThreeCard($max)) {
		echo "three card\n";
		continue;
	}
	if (isTwoPair($group)) {
		echo "two pair\n";
		continue;
	}
	if (isOnePair($group)) {
		echo "one pair\n";
		continue;
	}
	echo "null\n";
}

function isFourCard($max) {
	return $max == 4;
}

function isThreeCard($max) {
	return $max == 3;
}

function isFullHouse($group) {
	$c = count($group);
	return ($group[$c - 1] == 3) && ($group[$c - 2] == 2);
}

function isTwoPair($group) {
	$c = count($group);
	return ($group[$c - 1] == 2) && ($group[$c - 2] == 2);
}

function isOnePair($group) {
	$c = count($group);
	return ($group[$c - 1] == 2) && ($group[$c - 2] < 2);
}

function isStraight($hand) {
	$min = $hand[0];
	if ($min == 1 && !in_array(2, $hand)) {
		for ($i = 10; $i <= 13; $i++) {
			if (!in_array($i, $hand)) {
				return false;
			}
		}
		return true;
	}
	for ($i = $min + 1; $i < $min + 5; $i++) {
		if (!in_array($i, $hand)) {
			return false;
		}
	}
	return true;
}