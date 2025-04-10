import std.stdio;
import std.ascii;
import std.range;
import std.array;
import std.functional;
import std.algorithm;
import std.conv;
import std.container;
import std.math;
import std.numeric;
import std.string;
import std.c.string;
import std.random;
import std.regex;
import std.typecons;

struct P {
    int id, score;
}

void main() {
    auto map = redBlackTree!("a[0] < b[0]", false, Tuple!(int, int));
    string s;
    P[] ps;
    while (true) {
        s = readln.chomp;
        if (s == "0,0") break;
        auto t = s.split(",").map!(to!int);
        int id = t[0],
            score = t[1];
        ps ~= P(id, score);
    }
    ps.sort!"a.score > b.score";
    int prev_score = ps[0].score;
    int cur_rank = 1;
    for (int i = 0; i < ps.length; i++) {
        if (prev_score == ps[i].score) {
            map.insert(tuple(ps[i].id, cur_rank));
        } else {
            cur_rank++;
            map.insert(tuple(ps[i].id, cur_rank));
            prev_score = ps[i].score;
        }
    }
    while (true) {
        s = readln.chomp;
        if (stdin.eof) break;
        int x = s.to!int;
        writeln(map.equalRange(tuple(x, -1)).front[1]);
    }
}