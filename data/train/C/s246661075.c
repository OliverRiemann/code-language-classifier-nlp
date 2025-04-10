#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

#define MAX 256
int main(){
    int side1[1000],side2[1000],side3[1000];
    int i,j,num;
    char str[MAX], *tp;

    i = 0;
    /* input */
    while (fgets(str,MAX,stdin) != NULL)
    {
        if (i == 0)
        {
            num = atoi(str);
            i++;
        }
        else
        {
            tp = strtok(str, " ");
            side1[i] = atoi(tp);
            tp = strtok(NULL, " ");
            side2[i] = atoi(tp);
            tp = strtok(NULL, "\n");
            side3[i] = atoi(tp);
            i++;
        }
    }

    /* output */
    for(i = 1; i <= num; i++)
    {
        if (side1[i] <= side2[i])
        {
            if (side2[i] <= side3[i])
            {
                if (pow(side3[i],2.0) == pow(side1[i],2.0) + pow(side2[i],2.0))
                {
                    printf("YES\n");
                }
                else
                {
                    printf("NO\n");
                }
            }
            else
            {
                if (pow(side2[i],2.0) == pow(side1[i],2.0) + pow(side3[i],2.0))
                {
                    printf("YES\n");
                }
                else
                {
                    printf("NO\n");
                }
            }
        }
        else
        {
            if (side1[i] <= side3[i])
            {
                if (pow(side3[i],2.0) == pow(side1[i],2.0) + pow(side2[i],2.0))
                {
                    printf("YES\n");
                }
                else
                {
                    printf("NO\n");
                }
            }
            else
            {
                if (pow(side1[i],2.0) == pow(side2[i],2.0) + pow(side3[i],2.0))
                {
                    printf("YES\n");
                }
                else
                {
                    printf("NO\n");
                }
            }
        }
    }

    return 0;
}