
import std.stdio;
import std.algorithm;
import std.array;
import std.conv;
import std.string;

T[][] permulate(T)(T[] items) {
  T[][] res;
  if (items.length == 1) return [items];
  foreach(uint i, T item; items) {
    res ~= remove(items.dup, i).permulate.map!((x) => item ~ x).array;
  }
  return res;
}

void solve(int[] items) {
  auto ops =
    [
     '+':(int x, int y) => x + y,
     '-':(int x, int y) => x - y,
     '*':(int x, int y) => x * y];
  
  foreach(i; permulate!(int)(items).sort) {
    foreach(char a_ch, a; ops) {
      foreach(char b_ch, b; ops) {
        foreach(char c_ch, c; ops) {
          auto num1 = a(b(c(i[0], i[1]), i[2]), i[3]);
          auto num2 = a(b(i[0], i[1]), c(i[2], i[3]));
          if (num1 == 10) {
            writeln("((( ", i[0], " ", c_ch, " ", i[1], " ) ", b_ch, " ", i[2], " ) ", a_ch, " ", i[3], " )");
            goto end;
          }
          else if (num2 == 10) {
            writeln("(( ", i[0], " ", b_ch, " ", i[1], " ) ", a_ch, " ( ", i[2], " ", c_ch, " ", i[3], " ))");
            goto end;
          }
        }
      }
    }
  }
  writeln(0);
 end:;
}

void main() {
  while(true) {
    int[] list = readln().chomp.split(" ").map!(to!(int)).array;
    if (list.filter!(x => x != 0).array == null) break;
    solve(list);
  }
}