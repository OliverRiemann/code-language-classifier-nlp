import std.stdio;
import std.string;
import std.algorithm;


void main() {
    foreach (input; stdin.byLine) {
        // 勝敗を判定
        string result = judge(input.chomp);

        // 結果を出力
        result.writeln;
    }
}

string judge(char[] banmen) {
    // 勝ち筋
    auto combs = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];

    // それぞれの配置を取得
    auto areas = ["o":getArea(banmen, 'o'), "x":getArea(banmen, 'x')];

    // 各々の配置が勝ち筋に沿っていれば、その記号を返す
    foreach(key; areas.keys) {
        foreach(comb; combs) {
            if(canFind(areas[key], comb[0]) &&
               canFind(areas[key], comb[1]) &&
               canFind(areas[key], comb[2])) return key;
        }
    }

    // どちらも勝ち筋に沿っていない場合はドローの記号を返す
    return "d";
}

int[] getArea(char[] banmen, char side) {
    int[] area = [];
    foreach (i; 0..9) {
        if(banmen[i] == side) { area ~= i; }
    }
    return area;
}