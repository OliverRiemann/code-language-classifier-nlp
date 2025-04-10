'use strict';

var len = 10;
var map = new Array(len);
for (var i = 0; i < map.length; ++i) {
	map[i] = new Array(len);
	for (var j = 0; j < map.length; ++j) {
		map[i][j] = 0;
	}
}

var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var inks = input.trim().split('\n');
//var inks = ['2,5,3','3,6,1','3,4,2','4,5,2','3,6,3','2,4,1'];
for (var i in inks) {
	var ink = inks[i].trim().split(',');
	ink[0] = parseInt(ink[0]);
	ink[1] = parseInt(ink[1]);
	++map[ink[0]][ink[1]];
	switch (ink[2]) {
		case '3':
			if (ink[0] - 2 >= 0) {
				++map[ink[0] - 2][ink[1]];
			}
			if (ink[0] + 2 < len) {
				++map[ink[0] + 2][ink[1]];
			}
			if (ink[1] - 2 >= 0) {
				++map[ink[0]][ink[1] - 2];
			}
			if (ink[1] + 2 < len) {
				++map[ink[0]][ink[1] + 2];
			}
		case '2':
			if (ink[0] - 1 >= 0 && ink[1] - 1 >= 0) {
				++map[ink[0] - 1][ink[1] - 1];
			}
			if (ink[0] - 1 >= 0 && ink[1] + 1 < len) {
				++map[ink[0] - 1][ink[1] + 1];
			}
			if (ink[0] + 1 < len && ink[1] - 1 >= 0) {
				++map[ink[0] + 1][ink[1] - 1];
			}
			if (ink[0] + 1 < len && ink[1] + 1 < len) {
				++map[ink[0] + 1][ink[1] + 1];
			}
		case '1':
			if (ink[0] - 1 >= 0) {
				++map[ink[0] - 1][ink[1]];
			}
			if (ink[0] + 1 < len) {
				++map[ink[0] + 1][ink[1]];
			}
			if (ink[1] - 1 >= 0) {
				++map[ink[0]][ink[1] - 1];
			}
			if (ink[1] + 1 < len) {
				++map[ink[0]][ink[1] + 1];
			}
			break;
	}
}

var zeroden = 0;
var maxden = 0;
for (var row in map) {
	for (var col in map[row]) {
		if (map[row][col] === 0) {
			++zeroden;
		} else if (map[row][col] > maxden) {
			maxden = map[row][col];
		}
	}
}
console.log(zeroden);
console.log(maxden);