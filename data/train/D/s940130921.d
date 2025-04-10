
import std.string;
import std.stdio;
import std.range;
import std.algorithm;
import std.array;
import std.conv;

void bfs(ref int[] table, int curr) {
  // 上下左右
  int[] directions = [1, 14, -1, -14];
  int[] que;
  que ~= curr;
  while(que != null) {
    auto point = que.front;
    que.popFront;    
    foreach(d; directions) {
      if (point + d < table.length && table[point + d] == 1) {
        que ~= point + d;
        table[point + d] = 0;
      }
    } 
  }
}

void main() {
  while(true) {
    int[] table;
    int count = 0;
    table ~= repeat(0).take(14).array;
    foreach(t; 0..12) {
      string line = readln.chomp;
      table ~= [0] ~ line.array.map!((x) => x.to!(int) - '0').array ~ [0];
    }
    table ~= repeat(0).take(14).array;
    foreach(i; 1..13) {
      foreach(j; 1..13) {
        int num = j + i * 14;
        if (table[num] == 1) {
          bfs(table, num);
          ++count;
        }
      }
    }
    writeln(count);
    readln;
    if (stdin.eof) goto end;
  }
 end:;
}