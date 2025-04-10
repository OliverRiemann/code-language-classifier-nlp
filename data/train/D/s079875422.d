import std.stdio;
import std.algorithm;
import std.string;
import std.array;
import std.conv;
import std.typecons;

int[][] F;
A[] ans;

struct P {
    int y, x;
}

struct A {
    int x, y, t;
}

int type(ulong len) {
    switch (len) {
        case 5: return 1;
        case 9: return 2;
        case 13: return 3;
        default: ;
    }
    throw new Error("?");
}

bool check() {
    foreach (i; 0 .. 10) 
        foreach (j; 0 .. 10) 
            if (F[i][j] > 0) return false;
    return true;
}

const Large = [
    P(0, 0),
    P(1, -1), P(1, 0), P(1, 1),
    P(2, -2), P(2, -1), P(2, 0), P(2, 1), P(2, 2),
    P(3, -1), P(3, 0), P(3, 1),
    P(4, 0)
];

const Medium = [
    P(0, 0), P(0, 1), P(0, 2),
    P(1, 0), P(1, 1), P(1, 2),
    P(2, 0), P(2, 1), P(2, 2)
];

const Small = [
    P(0, 0),
    P(1, -1), P(1, 0), P(1, 1),
    P(2, 0)
];
 
bool tryIt(int pos, const P[] D) {
    int y = pos / 10, x = pos % 10;
    foreach (d; D) {
        int ny = y + d.y, nx = x + d.x;
        if (! (0 <= ny && ny < 10 && 0 <= nx && nx < 10) ) return false;
        if (F[ny][nx] <= 0) return false;
    }
    foreach (d; D) {
        int ny = y + d.y, nx = x + d.x;
        F[ny][nx]--;
    }
    if (solve(pos)) {
        P med = D[$ / 2];
        ans ~= A(x + med.x, y + med.y, D.length.type);
        return true;
    }
    foreach (d; D) {
        int py = y + d.y, px = x + d.x;
        F[py][px]++;
    }
    return false;
}

bool solve(int pos = 0) {
    if (pos == 100) return check();
    int y = pos / 10, x = pos % 10;
    if (F[y][x] == 0) return solve(pos + 1);

    if (tryIt(pos, Large) || tryIt(pos, Medium) || tryIt(pos, Small)) {
        return true;
    }
    return false;
}

void main() {
    int N; readf("%d\n", &N);
    F = new int[][10];
    foreach (ref L; F) L = readln.chomp.split(" ").map!(to!int).array;
    solve;
    foreach (a; ans) {
        writeln(a.x, " ", a.y, " ", a.t);
    }
}