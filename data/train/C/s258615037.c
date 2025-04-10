#include <stdio.h>

void judge_triangle(int side1, int side2, int side3);

int main(void)
{
    int i, j, number;/*submitすると、"code.c: In function ‘main’:
code.c:10:5: error: ‘for’ loop initial declarations are only allowed in C99 mode
code.c:10:5: note: use option -std=c99 or -std=gnu99 to compile your code
code.c:13:14: error: redefinition of ‘i’
code.c:10:14: note: previous definition of ‘i’ was here
code.c:13:5: error: ‘for’ loop initial declarations are only allowed in C99 mode"
と出るのでfor外でi,　jの宣言をしました。*/
    scanf("%d", &number);
    int side1[number], side2[number], side3[number];
    for (i = 0; i < number; i++) {
        scanf("%d %d %d", &side1[i], &side2[i], &side3[i]);
    }
    for (j = 0; j < number; j++) {
        judge_triangle(side1[j], side2[j], side3[j]);
    }
    return 0;
}

void judge_triangle(int side1, int side2, int side3)
{
    int shorter1, shorter2, longest;
    if(side1 <= side2) {
        shorter1 = side1;
        shorter2 = side2;
    } else {
        shorter1 = side2;
        shorter2 = side1;
    }
    if(shorter2 <= side3) {
        longest = side3;
    } else {
        longest = shorter2;
        shorter2 = side3;
    }
    if (longest * longest == shorter1 * shorter1 + shorter2 * shorter2) {
        printf("YES\n");
    } else {
        printf("NO\n");
    }
    return;
}