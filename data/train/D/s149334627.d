import std.stdio;
import std.string;
import std.conv;
import std.array;
import std.algorithm;



void main() {
    // 先月の取引を取り込む
    auto prevTradeList = inputTradeList();

    // 今月の取引を取り込む
    auto tradeList = inputTradeList();

    foreach (trade; tradeList.keys.sort()) {
        if (trade in prevTradeList) {
            writeln(join([trade.to!string, (prevTradeList[trade] + tradeList[trade]).to!string], " "));
        }
    }
}

/*
 * 標準入力から取引のデータを取り込み、リストに登録する。
 * 入力の長さが0の場合、終了と見なす。
 */
int[int] inputTradeList() {
    int[int] tradeList;

    foreach (input; stdin.byLine) {
        if (input.length == 0) break;

        auto trade = input.split(",").map!(to!int);
        tradeList = addTradeList(trade[0], tradeList);
    }

    return tradeList;
}

/*
 * 取引履歴を走査し、同じ取引が
 * 1. あれば、その取引のcountをインクリメント
 * 2. なければ、取引履歴に追加
 */
int[int] addTradeList(int tradeId, int[int] prevTradeList) {
    if (tradeId in prevTradeList) {
        prevTradeList[tradeId]++;
    } else {
        prevTradeList[tradeId] = 1;
    }

    return prevTradeList;
}