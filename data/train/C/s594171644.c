#include<stdio.h>
#include<math.h>
#include<stdlib.h>

/*int max_bai(long a long b);*/

int min_yaku(long a, long max ,long b);

int main(void)
{
        unsigned long a = 0, b = 0, min = 0, max = 0;
        unsigned long i = 0 , r = 0, memoa=0,memob=0;

        while(scanf("%ld %ld", &a , &b) != EOF)
        {

                memoa = a;
                memob = b;
                if(a == b)
                {
                        max = a;
                        min = min_yaku(memoa, max, memob);
                        printf("%ld %ld\n", max, min);
                }
                else if(a != b)
                {
                        while(a != b)
                        {
                                r = abs(a - b);
                                a = b;
                                b = r;
                        }
                        max = a;
                        min = min_yaku(memoa, max, memob);
                        printf("%ld %ld\n", max, min);
                }
        }
        return 0;
}
int min_yaku(long a ,long max ,long b)
{
        long min=0;
        min = a / max * b;
        return min;
}