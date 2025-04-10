module Main;

import std.stdio;
import std.string;
import std.conv;
import std.array;
import std.range;
import std.algorithm;

alias map!(to!string) stringize;



void main() {
    string input;

    while ((input = readln.chomp).length != 0) {
        int[] tehai = new int[](9);
        int[] yama = new int[](9);
        int[] ans;

        fill(yama, 4);
        foreach (i; 0..13) {
            int index = (input[i] - '0').to!int;
            tehai[index-1]++;
            yama[index-1]--;
        }

        ans = agari(tehai, yama);
        if (ans.length == 0) {
            writeln(0);
        } else {
            writeln(ans.stringize.join(" "));
        }
    }
}

int[] agari(int[] tehai, int[] yama) {
    int[] ans;

    foreach (i; 0..tehai.length) {
        if (yama[i] == 0) continue;

        tehai[i]++;
        foreach (j; 0..tehai.length) {
            if (tehai[j] < 2) continue;

            tehai[j] -= 2;
            if (yaku(tehai, 0)) ans ~= (i + 1).to!int;
            tehai[j] += 2;
        }
        tehai[i]--;
    }

    return ans;
}

bool yaku(int[] haipai, int num_yaku) {
    if (num_yaku >= 4) return true;

    int[] tehai;
    foreach (i; 0..haipai.length) {
        /* 順子が成立するかの判定 */
        if (i >= 2 && haipai[i - 2] > 0 && haipai[i - 1] > 0 && haipai[i] > 0) {
            tehai = haipai.dup;
            tehai[i - 2]--;
            tehai[i - 1]--;
            tehai[i]--;
            return yaku(tehai, ++num_yaku);
        }

        /* 刻子が成立するかの判定 */
        if (haipai[i] >= 3) {
            tehai = haipai.dup;
            tehai[i] -= 3;
            return yaku(tehai, ++num_yaku);
        }
    }

    return false;
}