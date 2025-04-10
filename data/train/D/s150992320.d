import std.stdio;
import std.c.stdio;
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
import std.regex;
import std.typecons;

int[] 素数集合() {
    const nの最大値 = 1000000;
    auto 表 = new bool[nの最大値];
    表[] = true;
    表[0] = 表[1] = false;
    int[] 集合;
    for (int i = 2; i < nの最大値; i++) {
        if (表[i]) {
            集合 ~= i;
            for (int j = i + i; j < nの最大値; j += i) {
                表[j] = false;
            }
        }
    }
    return 集合;
}
 
void main() {
    int n;
    auto 集合 = 素数集合();
    while (~scanf("%d\n", &n)) {
        if (n < 2) {
            writeln(0);
            continue;
        }
        int 下限 = 0, 上限 = cast(int)集合.length;
        while (下限 + 1 < 上限) {
            int 中間 = (下限 + 上限) / 2;
            if (集合[中間] <= n) {
                下限 = 中間;
            } else {
                上限 = 中間;
            }
        }
        writeln(下限 + 1);
    }
}