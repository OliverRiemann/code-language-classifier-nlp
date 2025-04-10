#include <stdio.h>

int count;

void comb(int n, int x) {                                                       
    int i;                                                                      
    for (i = 0; i < 10; i++) {                                                  
        if (n - i < 0)                                                          
            return;                                                             
        if (n - i == 0 && x == 0) {                                             
            count++;                                                            
            return;                                                             
        }                                                                       
        if (x > 0) {                                                            
            comb(n - i, x - 1);                                                 
        }                                                                       
    }                                                                           
}

int main(void) {                                                                
    int n;                                                                      
                                                                                
    while(scanf("%d", &n) != EOF) {                                             
        count = 0;                                                              
        comb(n, 3);                                                             
        printf("%d\n", count);                                                  
    }                                                                           
    return 0;                                                                   
}