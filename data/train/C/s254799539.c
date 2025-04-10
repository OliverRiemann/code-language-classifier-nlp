#include <stdio.h>
#include <stdlib.h>

typedef struct _digits{
    int a,b;
    struct _digits* next;
}digits_t;

digits_t* init_d(a,b)
{
    digits_t* d;
    d=(digits_t*)malloc(sizeof(digits_t));
    d->a=a; d->b=b;
    d->next=NULL;
    return d;
}

int get_digit(int x)
{
    int cnt=0;
    while(x){
        cnt++;
        x=x/10;
    }
    return cnt;
}

//#define __DEBUG_MODE__

#ifdef __DEBUG_MODE__
#define dbg(fmt, ...)\
    printf("debug:" fmt, __VA_ARGS__)
#else
#define dbg(fmt, ...) 
#endif

int main(void)
{
    int a,b;
    int cnt;
#ifndef __DEBUG_MODE__
    FILE* fp=stdin;
#else
    FILE* fp;
    fp=fopen("./input.txt","r");
#endif
    digits_t *start,*crnt;
    start=crnt=init_d(0,0);  //start is dummy 
    while(feof(fp)==0){
        fscanf(fp,"%d %d\n",&a,&b);
        crnt=crnt->next=init_d(a,b);
        dbg("%d %d\n",a,b);
        dbg("seek:%ld\n",ftell(fp));
    }
    for(crnt=start->next;crnt!=NULL;crnt=crnt->next){
        printf("%d\n",get_digit(crnt->a+crnt->b));
    }
    return 0;
}
               
    
    