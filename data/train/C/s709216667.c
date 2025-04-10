#include <stdio.h>                                                                     
#include <stdlib.h> 
 
void* smalloc ( size_t size ) 
{ 
    void* pntr = malloc( size );  
    if ( pntr == NULL ) 
    {   
        fputs( "malloc failed.\n", stderr );  
        exit( EXIT_FAILURE );  
    }   
    return pntr; 
} 
 
void sorter ( int* data, int elements ) 
{ 
    int i, j, cmp, key; 
 
    for ( i = 0; i < elements; i++ ) 
    {   
        key = data[i]; 
 
        for ( j = i; j > 0; j-- ) 
        {   
            cmp = data[j - 1]; 
            if ( key < cmp ) 
            {   
                break; 
            }   
            else 
            {   
                data[j] = cmp; 
            }   
        }   
 
        data[j] = key; 
    }   
} 
 
int main ( void ) 
{ 
    int i; 
    int* data = (int*)smalloc( sizeof(int) * 10 ); 
 
    for ( i = 0; i < 10; i++ ) 
    { 
        scanf("%d", data + i); 
    } 
 
    sorter(data, 10); 
 
    for ( i = 0; i < 3; i++ ) 
    { 
        printf("%d\n", data[i]); 
    } 
 
    free(data); 
 
    return 0; 
}                                                                                      