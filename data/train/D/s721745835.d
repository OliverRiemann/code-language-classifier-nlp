
import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.array;

const int[] type_small  = [0, 9, 10, 11, 20];
const int[] type_middle = [0, 1, 2, 10, 11, 12, 20, 21, 22];
const int[] type_big    = [0, 9, 10, 11, 18, 19, 20, 21, 22, 29, 30, 31, 40];
const int[] center = [10, 11, 20];
const int[] type_max = [20, 22, 40];

bool search_pos(int[] field, int start, ref int[][] pos, int drops) {
  foreach(i; start..100) {
    if (field[i] >= 1) {
      foreach(int index, type; [type_small, type_middle, type_big]) {
        // match
        if ((type_max[index] + i) < field.length && find!((x) => field[i + x] == 0)(type).array == []) {
          auto new_pos = pos ~ [index, center[index] + i];
          foreach(ref k; type) field[k + i] -= 1;
          bool result = search_pos(field, i, new_pos, drops);
          if (result && new_pos.length == drops) {
            pos = new_pos;
            return true;
          }
          foreach(ref k; type) field[k + i] += 1;
        }
      }
      return false;
    }
  }
  return true;
}

void main() {
  int drops = readln.chomp.to!(int);
  int[] field;
  foreach(i; 0..10) {
    field ~= readln.chomp.split(" ").map!(to!(int)).array;
  }
  int[][] pos;
  if (!search_pos(field, 0, pos, drops)) throw new Exception("illegal answer");
  foreach(p; pos) {
    writefln("%d %d %d", p[1] % 10, p[1] / 10, p[0] + 1);
  }
}