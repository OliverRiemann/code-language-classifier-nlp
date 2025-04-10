
import std.stdio;
import std.conv;
import std.range;
import std.array;
import std.string;
import std.algorithm;

bool is_correct(uint[] nums, bool comb2, uint index, uint rest) {
  if (rest == 0) {
    if (comb2) return true;
    else return false;
  }
  if (nums[index] == 0)
    return is_correct(nums, comb2, index + 1, rest);
  if (nums[index] == 3) {
    nums[index] -= 3;
    if (is_correct(nums, comb2, index, rest - 3)) return true;
    nums[index] += 3;
  }
  if (nums[index] == 2) {
    if (!comb2) {
      nums[index] -= 2;
      if (is_correct(nums, true, index, rest - 2)) return true;
      nums[index] += 2;
    }
  }
  if (index + 2 < nums.length && nums[index] >= 1 && nums[index + 1] >= 1 && nums[index + 2] >= 1) {
    nums[index..(index + 3)] = nums[index..(index + 3)].map!((x) => x - 1).array;
    if (is_correct(nums, comb2, index, rest - 3)) return true;
    nums[index..(index + 3)] = nums[index..(index + 3)].map!((x) => x + 1).array;
  }
  return false;  
}

void main() {
  while(true) {
    string line = readln.chomp;
    if (stdin.eof) break;
    auto nums = line.dup.map!((x) => x.to!(uint) - '0').array;
    uint[] table = new uint[](9);
    uint[] ans = [];
    foreach(n; nums) table[n - 1]++;
    foreach(i; 0..9) {
      table[i]++;
      if (reduce!((max, x) => (max > x) ? max : x)(0, table) > 4) {
        table[i]--;
        continue;
      }
      else if (is_correct(table.dup, false, 0, 14)) ans ~= i;
      table[i]--;
    }
    if (ans == []) writeln(0);
    else ans.map!((x) => (x + 1).to!(string)).join(" ").writeln;
  }
}