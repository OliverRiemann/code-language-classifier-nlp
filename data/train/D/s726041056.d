
import std.stdio;
import std.conv;
import std.string;
import std.algorithm;
import std.array;

// [0] -> value, [1] -> weight
int[] solve(int[][] items, int limit) {
  int[][] dp = new int[][](items.length + 1, limit + 1);
  int[int] weight;

  for(int i = 0; i < items.length; i++) {
    for(int j = 0; j <= limit; j++) {
      if (j < items[i][1]) {
        dp[i + 1][j] = dp[i][j];
      } else {
        int v = dp[i][j - items[i][1]] + items[i][0];
        if (v > dp[i][j]) {
          dp[i + 1][j] = v;
          if (v in weight) {
            weight[v] = min(weight[v], j);
          } else {
            weight[v] = j;
          }
        } else {
          dp[i + 1][j] = dp[i][j];
        }
      }
    }
  }
  return [dp[items.length][limit], weight[dp[items.length][limit]]];
}

int readnum() {return readln.chomp.to!(int);}

void main() {
  uint index = 1;
  while(true) {
    int limit = readnum;
    if (limit == 0) break;
    int times = readnum;
    int[][] items;
    foreach(t; 0..times) {
      items ~= readln.chomp.split(",").map!(to!(int)).array;
    }
    writeln("Case ", index++, ":");
    solve(items, limit).map!(to!(string)).join("\n").writeln;
  }
}