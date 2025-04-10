#include <stdio.h>
#include <string.h>
//#define DEBUG
#define MAX 20

#ifdef DEBUG
#define DBGPRINTF(...) printf(__VA_ARGS__)
#else
#define DBGPRINTF(...)
#endif

int main( int argc, char *argv[] )
{
    int i, j, tmp, m[2], loopcount = 0, tencount;
    char s[MAX];

    {
        while( ( fgets( s, MAX, stdin ) != NULL ) && ( loopcount < 200 ) )
        {
            DBGPRINTF( "%s", s );

            if ( sscanf( s, "%d %d", &m[0], &m[1] ) == 2 )
            {

                DBGPRINTF( "m[0]: %d, m[1]: %d, m[0]+m[1]: %d\n", m[0], m[1], m[0]+m[1] );

                tmp = m[0] + m[1];
                tencount = 0;
                for ( ; ; )
                {
                    tmp /= 10;
                    if ( tmp == 0 )
                    {
                        break;
                    }
                    else
                    {
                        tencount++;
                    }
                }
                printf( "%d\n", tencount + 1 );
                loopcount++;
                memset( s, 0, sizeof(s) );
            }
        }

    }

    return 0;

}