#include <stdio.h>

int gcd(int a, int b) {                                                         
    if (a % b == 0) {                                                           
        return b;                                                               
    } else {                                                                    
        return gcd(b, a % b);                                                   
    }                                                                           
}

int main(void) {                                                                
    int a, b;                                                                   
    int g;                                                                      
    int l;                                                                      
                                                                                
    while (scanf("%d %d", &a, &b) != EOF) {                                     
        if (a > b) {                                                            
            g = gcd(a, b);                                                      
        } else {                                                                
            g = gcd(b, a);                                                      
        }                                                                       
        l = (a / g) * b;                                                        
        printf("%d %d\n", g, l);                                                
    }                                                                           
    return 0;                                                                   
}