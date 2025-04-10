#include <stdio.h>

#define MIN(a,b) (((a)>(b))?(b):(a))
#define MAX(a,b) (((a)>(b))?(a):(b))

int main(void)
{
    //for debug
    FILE *fin, *fout;
//#define DEBUG
#ifdef DEBUG
    fin=fopen("input.txt","r");
    fout=fopen("output.txt","w");
#else
    fin=stdin; fout=stdout;
#endif

    //process all input data
    while(feof(fin)==0){
        int a,b;
        fscanf(fin,"%d %d\n",&a,&b);
        int i;
        //gcd is at least 1
        int gcd=1;

        //either a or b can be divided by the other
        if(MAX(a,b)%MIN(a,b)==0){
            gcd=MIN(a,b);
        }
        //otherwise, gcd is ranging between 1..minimum of a,b
        else{
            for(i=MIN(a,b)/2;i>=1;i--){
                //gcd found
                if(a%i==0 && b%i==0){ 
                    gcd=i;
                    break;
                }
            }
        }
        //calc lcm
        long long int lcm=gcd*(a/gcd)*(b/gcd);
        //write result
        fprintf(fout,"%d %lld\n",gcd,lcm);
    }


    return 0;
}