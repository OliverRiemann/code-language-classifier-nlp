
import std.stdio, std.conv, std.algorithm;
import std.range, std.array, std.math;

void dump(int[][] field, int n) {
  for(int i = 0; i <= n + 1; i++) {
    for(int j = 0; j <= n + 1; j++) {
      writef("%2d%s", field[i][j], j == (n + 1) ? "\n" : " ");
    }
  }
}

void main() {
  int edge;
  while(readf("%d\n", &edge), edge != 0) {
    int[][] field = new int[][](edge + 2, edge + 2);
    for(int i = 0; i <= (edge + 1); i++) {
      field[0][i] = -1;
      field[i][0] = -1;
      field[edge + 1][i] = -1;
      field[i][edge + 1] = -1;
    }
    for(int i = 1; i <= edge; i++) {
      string s;
      readf("%s\n", &s);
      for(int j = 0; j < edge; j++) {
        switch(s[j]) {
        case '*':
          field[i][j + 1] = -1;
          break;
        case '.':
          field[i][j + 1] = 1;
          break;
        default:
          throw new Exception("unknown value");
        }
      }
    }
    int square = 0;
    for(int i = edge; i >= 1; i--) {
      for(int j = edge; j >= 1; j--) {
        if (field[i][j] == -1) continue;
        if (field[i + 1][j] != -1 &&
            field[i][j + 1] != -1 &&
            field[i + 1][j + 1] != -1) {
          field[i][j] =
            min(field[i][j + 1], field[i + 1][j], field[i + 1][j + 1]) + 1;
        }
        square = max(square, field[i][j]);
      }
    }
    writeln(square);
  }
}