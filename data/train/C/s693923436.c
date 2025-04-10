#include <stdio.h>
#include <math.h>

int main(int argc, const char * argv[]) {
    int n, i, j, k;
    int count;//素数の個数
    int l[100000];//素数の数を格納
    
    while (scanf("%d", &n) != EOF) {
        count = 0;
        //偶数で素数を持つのは2のみ
        if (n >= 2){
            l[count++] = 2;
            //printf("l[%d] = %d\n",count - 1,l[count - 1]);//
        }
        
        //2より大きい偶数は素数を持たないので奇数のみ検査
        if (n >= 3) {
            l[count++] = 3;
            //printf("l[%d] = %d\n",count - 1,l[count - 1]);//
            
            for (i = 5; i <= n; i+=2) {
                k = 0;
                //エラトステネスのふるい
                for (j = 1; pow(l[j],2) <= i; j++) {
                    if (i % l[j] == 0) {
                        k = 1;
                        break;
                    }
                }
                
                if (k == 0){
                    l[count++] = i;
                    //printf("l[%d] = %d\n",count - 1,l[count - 1]);//
                }
            }
        }
        printf("%d\n", count);
    }
    return 0;
}