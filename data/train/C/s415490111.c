/*
 *  連立方程式
        ax + by = c
        dx + ey = f
    の解、x, y を出力して終了するプログラムを作成して下さい。
    a, b, c, d, e, f はそれぞれ、 -1000 以上 1000 以下の実数とし、連立方程式の解が一意に存在するように与えれれるものとします。
     
    Input
    複数のデータセットが与えられます。入力の最後まで処理して下さい。１つのデータセットが１行に与えられます。
    １つのデータセットに a, b, c, d, e, f が１つのスペースで区切られて与えられます。
     
    Output
    各データセットに対して、x, y を１つのスペースで区切って１行に出力して下さい。
    各値は小数点以下第３位まで出力して下さい。小数点以下第４位を四捨五入して下さい。
     
    x，yは以下の解法で求める
    x = (ce - fb) / (ae -bd)
    y = (cd - fa) / (bd - ae)
 
 */
#include <stdio.h>
#include <stdlib.h>
 
int main(void) {
    char buff[1000];
    int a, b, c, d, e, f;
    double x, y;
 
    while(fgets(buff, sizeof(buff), stdin) != NULL){
        if(sscanf(buff,("%d %d %d %d %d %d"),
            &a, &b, &c, &d, &e, &f) != 6) exit(-1);
 
        if( a < -1000 || a > 1000 ||
            b < -1000 || b > 1000 ||
            c < -1000 || d > 1000 ||
            d < -1000 || d > 1000 ||
            e < -1000 || e > 1000 ||
            f < -1000 || f > 1000
            ) exit(-1);
 
        x = (double)(c*e - f*b) / (a*e - b*d);
        y = (double)(c*d - f*a) / (b*d - a*e);
 
        printf("%.3f %.3f\n",x  + 0.00001,y  + 0.00001);
    }
    return 0;
}