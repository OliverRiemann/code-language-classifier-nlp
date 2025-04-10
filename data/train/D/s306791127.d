import std.stdio;
import std.algorithm;
import std.string;
import std.range;
import std.array;
import std.conv;
import std.complex;
import std.math;


bool canS(int[10][] a, int x, int y) {
	if(0 < x && x < 9 && 0 < y && y < 9) {
		for(int i = -1; i <= 1; i += 2) {
			if(a[x+i][y] == 0 || a[x][y+i] == 0)
				return false;
		}
		return true;
	}
	return false;
}
bool canM(int[10][] a, int x, int y) {
	if(0 < x && x < 9 && 0 < y && y < 9) {
		for(int i = -1; i <= 1; ++i){
			for(int j = -1; j <= 1; ++j) {
				if(a[x+i][y+j] == 0)
					return false;
			}
		}
		return true;
	}
	return false;
}
bool canL(int[10][] a, int x, int y){
	return canS(a, x-1, y) && canS(a, x, y-1) && canS(a, x+1, y) && canS(a, x, y+1);
}
int[][] S = [[0,1,0],[1,1,1],[0,1,0]];
int[][] M = [[1,1,1],[1,1,1],[1,1,1]];
int[][] L = [[0,0,1,0,0],[0,1,1,1,0],[1,1,1,1,1],[0,1,1,1,0],[0,0,1,0,0]];

void apply(int[10][] a, int[][] b, int x, int y) {
	auto x_ = b.length/2;
	auto y_ = b.length/2;
	for(int i; i < b.length; ++i) {
		for(int j; j < b.length; ++j){
			a[x+i-x_][y+j-y_] -= b[i][j];
		}
	}
}
void unapply(int[10][] a, int[][] b, int x, int y) {
	auto x_ = b.length/2;
	auto y_ = b.length/2;
	for(int i; i < b.length; ++i) {
		for(int j; j < b.length; ++j){
			a[x+i-x_][y+j-y_] += b[i][j];
		}
	}
}

string dfs(int n, int[10][] a, int x, int y, int m) {
	if(n == 0) {
		if(m == 0)
			return "";
		else
			return null;
	}
	if(m > n*13) {
		return null;
	}
	while(y < 10) {
		if(2 < y && a[x][y-3] > 0)
			return null;
		if(a[x][y] > 0){
			if(canL(a, x, y)) {
				apply(a, L, x, y);
				auto ret = dfs(n-1, a, x, y, m-13);
				if(ret !is null) {
					return ret ~ to!string(x) ~ " " ~ to!string(y) ~ " 3\n";
				}
				unapply(a, L, x, y);
			}
			if(canM(a, x, y)) {
				apply(a, M, x, y);
				auto ret = dfs(n-1, a, x, y, m-9);
				if(ret !is null) {
					return ret ~ to!string(x) ~ " " ~ to!string(y) ~ " 2\n";
				}
				unapply(a, M, x, y);
			}
			if(canS(a, x, y)) {
				apply(a, S, x, y);
				auto ret = dfs(n-1, a, x, y, m-5);
				if(ret !is null) {
					return ret ~ to!string(x) ~ " " ~ to!string(y) ~ " 1\n";
				}
				unapply(a, S, x, y);
			}
		}
		++x;
		if(x == 10) {
			x = 0;
			++y;
		}
	}
	return null;
}

void main() {
	auto n = to!int(readln().strip());
	int[10][10] a;
	int m;
	for(int i; i < 10; ++i){
		auto s = readln().strip().split();
		for(int j; j < 10; ++j){
			a[j][i] = to!int(s[j]);
			m += a[j][i];
		}
	}
	write(dfs(n, a, 0, 0, m));
}