#include <stdio.h>
#include <string.h>

/*                                                                              
int main(void) {                                                                
    char str[21];                                                               
    int i;                                                                      
                                                                                
    scanf("%s", str);                                                           
    for (i = strlen(str) - 1; i >= 0; i--) {                                    
        putchar(str[i]);                                                        
    }                                                                           
    putchar('\n');                                                              
    return 0;                                                                   
}                                                                               
*/

int reverse() {                                                                 
    int c;                                                                      
    if ((c = getchar()) == '\n')                                                
        return;                                                                 
    reverse();                                                                  
    putchar(c);                                                                 
}

int main(void) {                                                                
    reverse();                                                                  
    putchar('\n');                                                              
    return 0;                                                                   }