
import std.stdio, std.string, std.conv, std.array, std.algorithm;

void main() {
  int[][] field;
  int[][] dp;
  string line;
  while (true) {
    line = readln.chomp;
    if (stdin.eof) break;
    field ~= line.split(",").map!(to!(int)).array;
  }
  foreach(int i, f; field) dp ~= new int[](f.length);
  int half = (field.length / 2).to!(int);
  for(int i = 1; i < field.length; i++) {
    for(int j = 0; j < field[i].length; j++) {
      if (half >= i) {
        if (j == field[i].length - 1) {
          field[i][j] += field[i - 1][j - 1];
        }
        else if (j == 0) {
          field[i][j] += field[i - 1][j];
        }        
        else {
          field[i][j] +=
            max(field[i - 1][j], field[i - 1][j - 1]);
        }
      }
      else if (half < i) {
        if (field[i].length / 2 <= i) {
          field[i][j] += max(field[i - 1][j], field[i - 1][j + 1]);
        }
        else {
          field[i][j] +=
            max(field[i - 1][j], field[i - 1][j]);
        }
      }
    }
  }
  writeln(field[$ - 1][0]);
}