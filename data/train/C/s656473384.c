#include <stdio.h>

int main() {
    // 変数宣言
    int N, i, in1, in2, in3, a, b, c;

    // データセットの数を入力で受け取る
    scanf("%d", &N);

    // ループを用いてN回処理をする
    for(i = 0; i < N; ++i) {

        // 3辺の長さを入力で受け取る
        scanf("%d %d %d", &in1, &in2, &in3);

        // a,b ≦ cとなるように
        // 3辺の長さをa,b,cに代入
        if(in1 >= in2 && in1 >= in3) {
            a = in2;
            b = in3;
            c = in1;
        } else if(in2 >= in1 && in2 >= in3) {
            a = in1;
            b = in3;
            c = in2;
        } else if(in3 >= in1 && in3 >= in2) {
            a = in1;
            b = in2;
            c = in3;
        }

        // 三平方の定理より、
        // 直角三角形であるかどうかを出力
        if(a*a + b*b == c*c) {
            printf("YES\n");
        } else {
            printf("NO\n");
        }

    } // ループここまで
    return 0;
}