#include<stdio.h>
#include<malloc.h>
void sweap(int *a,int *b){
    int t;
    t=*a,*a=*b,*b=t;
}
int main(){
    int *a,*b,*c,*n;
    a=(int *)malloc(sizeof(int));
    b=(int *)malloc(sizeof(int));
    c=(int *)malloc(sizeof(int));
    n=(int *)malloc(sizeof(int));
    scanf("%d%d%d%d",a,b,c,n);
    if(*a<*b)sweap(a,b);
    if(*b<*c)sweap(b,c);
    if(*c<*n)sweap(c,n);
    if(*a<*b)sweap(a,b);
    if(*b<*c)sweap(b,c);
    if(*a<*b)sweap(a,b);
    scanf("%d",n);
    if(*a<*n)sweap(a,n);
    if(*b<*n)sweap(b,n);
    if(*c<*n)sweap(c,n);
    scanf("%d",n);
    if(*a<*n)sweap(a,n);
    if(*b<*n)sweap(b,n);
    if(*c<*n)sweap(c,n);
    scanf("%d",n);
    if(*a<*n)sweap(a,n);
    if(*b<*n)sweap(b,n);
    if(*c<*n)sweap(c,n);
    scanf("%d",n);
    if(*a<*n)sweap(a,n);
    if(*b<*n)sweap(b,n);
    if(*c<*n)sweap(c,n);
    scanf("%d",n);
    if(*a<*n)sweap(a,n);
    if(*b<*n)sweap(b,n);
    if(*c<*n)sweap(c,n);
    scanf("%d",n);
    if(*a<*n)sweap(a,n);
    if(*b<*n)sweap(b,n);
    if(*c<*n)sweap(c,n);
    printf("%d\n%d\n%d\n",*a,*b,*c);
    return 0;
}