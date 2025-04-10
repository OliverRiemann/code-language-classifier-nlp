#include <stdio.h>
#include <math.h>

/*                                                                              
 *                                                                              
 */
int combi(int n, int x) {                                                       
    int i, count = 0;                                                           
    if (n > x * 9)                                                              
        return 0;                                                               
    if (x == 2) {                                                               
        if (n < 19)                                                             
            return 10 - abs(n - 9);                                             
        else                                                                    
            return 0;                                                           
    }                                                                           
    if (x == 1) {                                                               
        if (n < 9)                                                              
            return 1;                                                           
        else                                                                    
            return 0;                                                           
    }                                                                           
    for (i = 0; i <= n && i < 10 ; i++) {                                       
        count += combi(n - i, x - 1);                                           
    }                                                                           
                                                                                
    return count;                                                               
}

int main(void) {                                                                
    int n;                                                                      
                                                                                
    while(scanf("%d", &n) != EOF) {                                             
        printf("%d\n", combi(n, 4));                                            
    }                                                                           
                                                                                
    return 0;                                                                   
}