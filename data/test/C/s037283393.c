#include <stdio.h>
#include <stdlib.h>

// coef[]
// aX + bY = c
// ^0   ^1   ^2
// dX + eY = f
// ^3   ^4   ^5
// answer[]
// X: answer[0]
// Y: answer[1]
// form_revA[4]
// [ p  q ]
//   ^0 ^1
// [ r  s ]
//   ^2 ^3
int alg ( int* coef, float* answer )
{
    float det, form_revA[4] = { 0 };

    if ( (det = coef[0] * coef[4] - coef[1] * coef[3]) == 0 )
        return -1;

    form_revA[0] = coef[4] / det;
    form_revA[1] = - ( coef[1] / det );
    form_revA[2] = - ( coef[3] / det );
    form_revA[3] = coef[0] / det;

    answer[0] = coef[2] * form_revA[0] + coef[5] * form_revA[1];
    answer[1] = coef[2] * form_revA[2] + coef[5] * form_revA[3];

    return 0;
}

int main ( void )
{
    int coef[6] = { 0 };
    float answer[2] = { 0.0 };

    while ( scanf("%d %d %d %d %d %d",
                &coef[0], &coef[1], &coef[2], &coef[3], &coef[4], &coef[5] )
            != EOF )
    {
        if ( alg( coef, answer ) < 0 )
            puts( "NO ANSWER" );
        else
            printf("%.3f %.3f\n", answer[0], answer[1] );
    }

    return 0;
}