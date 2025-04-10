#include<stdio.h>
int gcd(int x, int y);
int lcm(int x, int y, int g);
int main()
{
    int g,l,x,y;
    while (scanf("%d%d",&x,&y) != EOF){
    g=gcd(x,y);
    l=lcm(x,y,g);
    //printf("最大公約数は%dです\n最小公倍数は%dです\n",g,l);
    printf("%d %d\n",g,l);
    }
    return 0;
}
int gcd(int x, int y)
{
    int a,b,c,GCD;
    if(x > y){
            a=x;
            b=y;
            for(;;){
                c = a % b;
                if(a % b == 0){
                    GCD=b;
                    break;
                }
                a=b;
                b=c;
            }
        }
        else if(x < y){
            a=y;
            b=x;
            for(;;){
                c = a % b;
                if(a % b == 0){
                    GCD=b;
                    break;
                }
                a=b;
                b=c;
            }
        }
        else if(x == y){
            GCD=x;
        }
        return GCD;
}
int lcm(int x, int y, int g)
{
    int LCM;
    LCM=(x/g)*(y/g)*g;
    return LCM;
}