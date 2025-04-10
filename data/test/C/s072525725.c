#include <stdio.h> 
 
typedef enum { 
    FALSE, 
    TRUE 
} bool_t; 
 
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
 
int square ( int input ) 
{ 
    return input * input; 
} 
 
// length[] should be sorted 
// assuming number of elements of length[] is 3 
bool_t alg ( int* length ) 
{ 
    if ( square(length[0]) == square(length[1]) + square(length[2]) )                  
        return TRUE;                             
    else                                         
        return FALSE; 
} 
 
int main ( void ) 
{ 
    bool_t result; 
    int linenum, i; 
    int data[3]; 
 
    scanf( "%d", &linenum ); 
 
    for ( i = 0; i < linenum; i++ ) 
    { 
        scanf( "%d %d %d", &data[0], &data[1], &data[2] ); 
        sorter( data, 3 ); 
        if ( alg(data) ) 
            puts( "YES" ); 
        else 
            puts( "NO" ); 
    } 
 
    return 0; 
} 