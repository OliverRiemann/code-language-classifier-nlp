#include <stdio.h>
#include <math.h>

int max(int n1, int n2, int n3) {
    int max;
    
    max = n1;
    
    if(n2 > max)
        max = n2;
    if(n3 > max)
        max = n3;
    
    return(max);
}

int others(int n1, int n2, int n3) {
    int na = 0;
    int nb = 0;
    int two_pow2;
    
    if(n1 != max(n1, n2, n3)) {
        na = n1;
    }
    if(n2 != max(n1, n2, n3)) {
        if(na == 0)
            na = n2;
        else {
            nb = n2;
        }
    }
    if(n3 != max(n1, n2, n3)) {
        if(na == 0 || nb == 0){
            if(na == 0)
                na = n3;
            else {
                nb = n3;
            }
        }
    }
    
    two_pow2 = pow(na, 2) + pow(nb, 2);
    
    return(two_pow2);
    
}

void two_pow2(int n1, int n2, int n3) {
    
    if(others(n1, n2, n3) == pow(max(n1, n2, n3), 2))
        puts("YES");
    else
        puts("NO");
    
}

int main(void) {
    int n1, n2, n3;
    int num, i;
    
    scanf("%d", &num);
    
        
    for(i = 0; i < num; i++) {
        if(num > 1000) break;
        
        scanf("%d %d %d", &n1, &n2, &n3);
    
        two_pow2(n1, n2, n3);
    }
    
    return(0);
}