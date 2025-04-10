var input = require('fs').readFileSync('/dev/stdin', 'utf8');
var lines = input.trim().split('\n');

var line;
while (line = lines.shift()) {
	var board = [];
	board.push(line.split('').map(function(f){return +f;}));
	for (var i = 0; i < 7; i++) {
		board.push(lines.shift().split('').map(function(f){return +f;}));
	}
	if (lines.length > 0)
		lines.shift();

	for (var y = 0; y < 8; y++) {
		for (var x = 0; x < 8; x++) {
			if (board[y][x])
				break;
		}
		if (board[y][x])
			break;
	}

	var fig;
	if (board[y][x+1] & board[(y+1)%8][x] & board[(y+1)%8][x+1]) fig = 'A';
	else if (board[(y+1)%8][x] & board[(y+2)%8][x] & board[(y+3)%8][x]) fig = 'B';
	else if (board[y][x+1] & board[y][x+2] & board[y][x+3]) fig = 'C';
	else if (board[(y+1)%8][x-1] & board[(y+1)%8][x] & board[(y+2)%8][x-1]) fig = 'D';
	else if (board[y][x+1] & board[(y+1)%8][x+1] & board[(y+1)%8][x+2]) fig = 'E';
	else if (board[(y+1)%8][x] & board[(y+1)%8][x+1] & board[(y+2)%8][x+1]) fig = 'F';
	else fig = 'G';

	console.log(fig);
}