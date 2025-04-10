#include<stdio.h>

int
main(int argc, char *argv[])
{
        int n;
        char buf[5];
        int table[10][10][10][10];
        int i,j,k,l;
        int cnt;

        for (i = 0; i < 10; i++)
                for (j = 0; j < 10; j++)
                        for (k = 0; k < 10; k++)
                                for (l = 0; l < 10; l++)
                                        table[i][j][k][l] = i + j + k + l;
        while (fgets(buf, 5, stdin)) {
                sscanf(buf, "%d", &n);
                if (n > 36) {
                        printf("0\n");
                        continue;
                }
                cnt = 0;
                for (i = 0; i < 10; i++)
                        for (j = 0; j < 10; j++)
                                for (k = 0; k < 10; k++)
                                        for (l = 0; l < 10; l++)
                                                if (table[i][j][k][l] == n) cnt++;
                printf("%d\n", cnt);
        }
        return 0;
}