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
    int i, j, tmp, m[3], loopcount = 0, datanum, flag;
    char s[MAX];

    scanf( "%d", &datanum );

    if ( datanum > 1000 ) datanum = 1000;

    DBGPRINTF( "datanum: %d\n", datanum );

    while( ( fgets( s, MAX, stdin ) != NULL ) && ( loopcount < datanum ) )
    {
        DBGPRINTF( "%s", s );

        if ( sscanf( s, "%d %d %d", &m[0], &m[1], &m[2] ) == 3 )
        {

            DBGPRINTF( "m[0]: %d, m[1]: %d, m[2]: %d\n", m[0], m[1], m[2] );

            flag = 0;

            if ( ( m[0] >= m[1] ) && ( m[0] >= m[2] ) )
            {
                /* m[0]???????????§?????? */
                if ( m[0] * m[0] == m[1] * m[1] + m[2] * m[2] ) flag = 1;
                
            }
            else if ( ( m[1] >= m[0] ) && ( m[1] >= m[2] ) )
            {
                /* m[1]???????????§?????? */
                if ( m[1] * m[1] == m[0] * m[0] + m[2] * m[2] ) flag = 1;
            }
            else if ( ( m[2] >= m[0] ) && ( m[2] >= m[1] ) )
            {
                /* m[2]???????????§?????? */
                if ( m[2] * m[2] == m[0] * m[0] + m[1] * m[1] ) flag = 1;
            }
            else
            {
                /* nanikore */
            }

            if ( flag > 0 ) 
            {
                printf( "YES\n" );
            }
            else 
            {
                printf( "NO\n" );
            }

            memset( s, 0, sizeof(s) );
        }
    }

    return 0;

}