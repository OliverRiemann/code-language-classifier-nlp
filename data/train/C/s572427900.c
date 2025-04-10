#include <stdio.h>

int main(void) {                                                                
    int i, n;                                                                   
    int money = 100000;                                                         
                                                                                
    scanf("%d", &n);                                                            
    for (i = 0; i < n; i++) {                                                   
        money = money * 1.05;                                                   
        if (money % 1000 != 0) {                                                
            money = ((money / 1000) + 1) * 1000;                                
        }                                                                       
    }                                                                           
    printf("%d\n", money);                                                      
                                                                                
    return 0;                                                                   
}