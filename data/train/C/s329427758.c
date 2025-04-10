#include <stdio.h>
#define MAX 10
//#define DEBUG

#ifdef DEBUG
#define DBGPRINTF(...) printf(__VA_ARGS__)
#else
#define DBGPRINTF(...)
#endif

int main( int argc, char *argv[] )
{
    int i, j, tmp;
    int m[MAX] = { 0 };

    DBGPRINTF( "argc: %d\n", argc );

//    if ( argc > 1 )
    {
        DBGPRINTF( "input value\n" );

#if 0
        for ( i = 0; i < argc - 1; i++ )
        {
            DBGPRINTF("%s\n", argv[i + 1] );
            sscanf( argv[i + 1], "%d", &m[i] );
            DBGPRINTF("%d\n", m[i] );
            DBGPRINTF("%s\n", argv[i + 1] );
        }

#else
        for ( i = 0; i < MAX; i++ )
        {
            scanf( "%d", &m[i] );
        }
#endif

        DBGPRINTF( "\n" );

        for ( i = 0; i < MAX - 1; i++ )
        {
            for ( j = 1; j < MAX; j++ )
            {
                DBGPRINTF( "m[%d]: %d, m[%d]: %d\n", j-1, m[j-1], j, m[j] );
                if ( m[ j - 1 ] < m[ j ] )
                {
                    tmp = m[ j - 1 ];
                    m[ j - 1 ] = m[ j ];
                    m[ j ] = tmp;
                }
            }
            DBGPRINTF( "processing output value\n" );
            for ( j = 0; j < MAX; j++ )
            {
                DBGPRINTF("%d\n", m[ j ] );
            }
            DBGPRINTF( "\n" );

        }

        DBGPRINTF( "output value\n" );
        for ( i = 0; i < MAX; i++ )
        {
            DBGPRINTF( "%d\n", m[ i ] );
        }

        DBGPRINTF( "\ntop3\n" );
        for ( i = 0; i < 3; i++ )
        {
            printf( "%d\n", m[ i ] );
        }
        
    }

    return 0;

}