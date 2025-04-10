import std.stdio;
import std.conv;
import std.string;
import std.typecons;
import std.algorithm;
import std.array;
import std.range;
import std.math;
import std.container;
import std.datetime;

void main()
{
	auto path = new int[][](5, 5);
	auto key = [' ', 'U', 'L', ' ', 'D', ' ', ' ', ' ', 'R'];
	auto dx = [0, 0, -1, 0, 0, 0, 0, 0, 1];
	auto dy = [0, -1, 0, 0, 1, 0, 0, 0, 0];
	foreach (i; 0..5) {
		auto x = readln.chomp;
		foreach (j, e; x) {
			if (e == '1') {
				path[i][j] |= 8;
				path[i][j+1] |= 2;
			}
		}
		if (i == 4) continue;
		auto y = readln.chomp;
		foreach (j, e; y) {
			if (e == '1') {
				path[i][j] |= 4;
				path[i+1][j] |= 1;
			}
		}
	}

	int x = 1, 
			y = 0, 
			dir = 8;
	write("R");
	while (x != 0 || y != 0) {
		auto d = dir << 1;
		if (d == 16) d = 1;
		if (path[y][x] & d) {
			x += dx[d];
			y += dy[d];
			write(key[d]);
			dir = d;
			continue;
		}
		d = dir;
		if (path[y][x] & d) {
			x += dx[d];
			y += dy[d];
			write(key[d]);
			continue;
		}
		d = dir >> 1;
		if (d == 0) d = 8;
		if (path[y][x] & d) {
			x += dx[d];
			y += dy[d];
			write(key[d]);
			dir = d;
			continue;
		}
		d = d >> 1;
		if (d == 0) d = 8;
		x += dx[d];
		y += dy[d];
		write(key[d]);
		dir = d; 
	}
	writeln("");
}