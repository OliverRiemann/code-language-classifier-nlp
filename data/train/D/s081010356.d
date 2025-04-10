
import std.stdio;
import std.conv;
import std.string;
import std.algorithm;
import std.array;

int read_number() {return readln.chomp.to!(int);}

bool is_correct(int[][] lot, int start, int finish) {
  uint curr = start;
  foreach(col; lot) {
    // writeln(col, " ", curr);
    if (col[curr - 1] == 1) curr--;
    else if (col[curr] == 1) curr++;
  }
  return curr == finish;
}

void main() {
  while(true) {
    int width = (read_number - 1);
    if (width == -1) break;
    int start = read_number;
    int finish = read_number;
    int height = read_number;
    int[][] lot = [];
    int[][] empty = [];           // [[i, j], ...]
    foreach(int i; 0..height) {
      lot ~= [0] ~ readln.chomp.dup.map!((x) => to!(int)(x - '0')).array ~ [0];
      foreach(int j; 0..width) {
        if (lot[i][j + 1] == 0 && lot[i][j + 2] == 0 && lot[i][j] == 0)
          empty ~= [i, j + 1];
      }
    }
    if (is_correct(lot, start, finish)) writeln(0);
    else {
      int[] ans = [];
      foreach(data; empty) {
        lot[data[0]][data[1]] = 1;
        if (is_correct(lot, start, finish)) {ans = data; break;}
        else {
          lot[data[0]][data[1]] = 0;
        }
      }
      if (ans == []) writeln(1);
      else writefln("%d %d", ans[0] + 1, ans[1]);
    }
  }
}