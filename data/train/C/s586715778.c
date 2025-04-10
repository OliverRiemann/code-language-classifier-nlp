#include <stdio.h>

int main ( int argc, char **argv )
{
    char buffer[100];
    int input_size = 0;
    
    while ( fgets(buffer, 100, stdin) != NULL )
    {
        sscanf(buffer, "%d", &input_size);

        int counter = 0;
        while ( counter < input_size )
        {
            int sides[3];
            int swap = 0;
            fgets(buffer, 100, stdin);
            sscanf(buffer, "%d %d %d", &sides[0], &sides[1], &sides[2]);

            int x = 0;
            for ( x = 0; x < 3; x++ )
            {
                if ( x + 1 == 3 )
                {
                    break;
                }

                if ( sides[x] > sides [x + 1] )
                {
                    swap = sides[x];
                    sides[x] = sides[x+1];
                    sides[x+1] = swap;
                }

            }

            if ( (sides[0] * sides[0]) + (sides[1] * sides[1]) == (sides[2] * sides[2]) )
            {
                printf("YES\n");
            }
            else
            {
                printf("NO\n");
            }

            counter++;
        }
    }

    return 0;
}