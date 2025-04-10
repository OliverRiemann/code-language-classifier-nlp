/* Find the greatest common divisor (GCD) and the least common multiple (LCM) of given a and b */
/* 1.Use the Euclidean algorithm to find GSD
   2.Use GSD to find LCM */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>



int GCD(int a , int b) /* Use the Euclidean algorithm to find GSD */
{
    int i=0; /*for iteration */
    int temp=0; /* a temporary place to hold variable */

    for(i=0 ; (b!=0) ; i++)
    {
        temp = a%b;
        a = b;
        b = temp;
    }
    return a;
}

int LCM(int a ,int b ) /* Use GSD to find LCM */
{
    int gcdvalue=0;
    int factorA=0; /* a divide by gcdvalue */
    int factorB=0; /* b divided by gcdvalue */

    gcdvalue = GCD(a,b);
    factorA = a / gcdvalue;
    factorB = b / gcdvalue;

    return ( gcdvalue * factorA * factorB );
}

int main()
{
    int a=0 , b=0;

    /* 1.Ask the user to enter two numbers , a and b */
    while(scanf("%d%d" ,&a,&b)!=EOF)
    {
     /* 2.Use the Euclidean algorithm to find GSD and print it */
     printf("%d " ,GCD(a,b));

     /* 3.Use GSD to find LCM */
     printf("%d\n" ,LCM(a,b));

    }

    return 0;
}

