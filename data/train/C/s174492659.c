#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

#define MAX 256

unsigned long euclid(unsigned long m, unsigned long n);

int main(){
    unsigned long a[1000],b[1000],gcd[1000],lcm[1000];
    int i,j,num;
    char str[MAX], *tp;

    /* input */
    while (fgets(str,MAX,stdin) != NULL)
    {
        tp = strtok(str, " ");
        a[i] = atoi(tp);
        tp = strtok(NULL, "\n");
        b[i] = atoi(tp);
        i++;
    }

    /* gcd */
    for(j = 0; j < i; j++)
    {
        if (a[j] >= b[j])
        {
            gcd[j] = euclid(a[j],b[j]);
        }
        else
        {
            gcd[j] = euclid(b[j],a[j]);
        }
    }


    /* lcm */
    for(j = 0; j < i; j++)
    {
        lcm[j] = (a[j] * b[j]) / gcd[j];
    }

    /* output */
    for(j = 0; j < i; j++)
    {
        printf("%ld %ld\n",gcd[j],lcm[j]);
    }

    return 0;
}


unsigned long euclid(unsigned long m, unsigned long n)
{
    unsigned long tmp;

    while (n != 0)
    {
        tmp = n;
        n = m % n;
        m = tmp;
    }

    return m;
}