import std.stdio;
import std.conv;
import std.string;
import std.typecons;
import std.algorithm;
import std.array;
import std.range;
import std.math;
//import std.regex;
import std.container;

void main()
{
	foreach (line; stdin.byLine) {
    int cnt[10];
    foreach (e; line.chomp) {
      cnt[e-'0']++;
    }
    int[int] res;
    foreach (i; 1..10) {
      auto tcnt = cnt.dup;
      tcnt[i]++;
      bool f1;
      foreach (j; 1..10) {
        if (tcnt[j] > 4) f1 = 1;
      }
      if (f1) continue;
      foreach (j; 1..10) {
        if (tcnt[j] < 2) continue;
        auto ttcnt = tcnt.dup;
        ttcnt[j] -= 2;
        bool f2;
        foreach (k; 1..10) {
          if (ttcnt[k] >= 3) {
            ttcnt[k] -= 3;
          }
          if (ttcnt[k] && k <= 7) {
            if (ttcnt[k] <= ttcnt[k+1] && ttcnt[k] <= ttcnt[k+2]) {
              ttcnt[k+1] -= ttcnt[k];
              ttcnt[k+2] -= ttcnt[k];
              ttcnt[k] = 0;
            }
          }
          if (ttcnt[k]) {
            f2 = 1;
            break;
          }
        }
        if (f2) continue;
        res[i]++;
        break;
      }
    }
    if (!res.keys.length) res[0]++;
    res.keys.sort.map!(to!string).join(" ").writeln;
  }
}