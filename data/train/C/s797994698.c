#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

#define MAX 256
int main(){
    float a[1000],b[1000],c[1000],d[1000],e[1000],f[1000],x[1000],y[1000];
    int i,j,num;
    char str[MAX], *tp;

    i = 0;
    /* input */
    while (fgets(str,MAX,stdin) != NULL)
    {
        tp = strtok(str, " ");
        a[i] = atoi(tp);
        tp = strtok(NULL, " ");
        b[i] = atoi(tp);
        tp = strtok(NULL, " ");
        c[i] = atoi(tp);
        tp = strtok(NULL, " ");
        d[i] = atoi(tp);
        tp = strtok(NULL, " ");
        e[i] = atoi(tp);
        tp = strtok(NULL, "\n");
        f[i] = atoi(tp);
        i++;
    }

    for (j = 0; j < i; j++)
    {
        if (a[j] >= d[j])
        {
            e[j] = e[j] - (b[j] * (d[j] / a[j]));
            f[j] = f[j] - (c[j] * (d[j] / a[j]));
            y[j] = f[j] / e[j];

            b[j] = b[j] * y[j];
            x[j] = (c[j] - b[j]) / a[j];

            x[j] = (roundf(x[j] * 1000)) / 1000;
            y[j] = (roundf(y[j] * 1000)) / 1000;
        }
        else
        {
            b[j] = b[j] - (e[j] * (a[j] / d[j]));
            c[j] = c[j] - (f[j] * (a[j] / d[j]));
            y[j] = c[j] / b[j];

            e[j] = e[j] * y[j];
            x[j] = (f[j] - e[j]) / d[j];

            x[j] = (roundf(x[j] * 1000)) / 1000;
            y[j] = (roundf(y[j] * 1000)) / 1000;
        }
    }

    /* output */
    for(j = 0; j < i; j++)
    {
        printf("%.3f %.3f\n",x[j],y[j]);
    }

    return 0;
}