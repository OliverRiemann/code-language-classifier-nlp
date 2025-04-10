
#include<stdio.h>
#include<math.h>

int main (void)
{


    int sets;

    scanf("%d",&sets);


    int a[1000][3];
    int b[1000][3] = {};

    int i;

    for(i = 0; i < sets; i++){
        scanf("%d%d%d",&a[i][0] ,&a[i][1] ,&a[i][2]);

        if((a[i][0] > a[i][1]) && (a[i][0] > a[i][2])){
            b[i][0] = 1;
        }else if((a[i][1] > a[i][0]) && (a[i][1] > a[i][2])){
            b[i][1] = 1;
        }else if((a[i][2] > a[i][0]) && (a[i][2] > a[i][1])){
            b[i][2] = 1;
        }

    }

    for(i = 0; i < sets; i++){

        //printf("%d%d%d",b[i][0],b[i][1],b[i][2]);

        if((b[i][0] == 1) && (a[i][0] * a[i][0] == a[i][1] * a[i][1] + a[i][2] * a[i][2]))
            printf("YES\n");
        else if((b[i][1] == 1) && (a[i][1] * a[i][1] == a[i][0] * a[i][0] + a[i][2] * a[i][2]))
            printf("YES\n");
        else if((b[i][2] == 1) && (a[i][2] * a[i][2] == a[i][0] * a[i][0] + a[i][1] * a[i][1]))
            printf("YES\n");
        else
            printf("NO\n");
    }


    return 0;
}