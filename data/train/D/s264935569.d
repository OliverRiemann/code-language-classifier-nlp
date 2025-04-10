import std.stdio, std.conv, std.string, std.algorithm, std.array, std.format;

void main()
{
    for( int iii=1; ; ++iii ){
        const w = readln.chomp.to!int;
        if ( w == 0 )
           break;
        const n = readln.chomp.to!int;

        int[][1001] item;

        item[0] = [0, 0];
        foreach( i; 0..n ) {
                        // Value: 0, Weight: 1
            item[i+1] = readln.chomp.split(",").map!(to!int).array;
        }

        //     W     N
        int dp[1002][1002];
        foreach( i; 0..w+1 )
            dp[i][0] = 0;
        foreach( i; 0..n+1 )
            dp[0][i] = 0;
        
        int max_v = 0;
        int max_w = 0;
        foreach( ni; 1..n+1 ) {
            foreach( wi; 1..w+1 ) {
                auto bw = wi - item[ni][1/*Weight*/];
                auto bi = ni - 1;

                if ( bw >= 0 ) {
                    auto cand = dp[bw][bi] + item[ni][0/*Value*/];  
                    dp[wi][ni] = max( cand, dp[wi][bi] );
                } else {  
                    dp[wi][ni] = dp[wi][bi];
                }

                if ( dp[wi][ni] > max_v || ( dp[wi][ni] == max_v && wi < max_w ) ) {
                   max_v = dp[wi][ni];
                   max_w = wi;
                }
            }
        }

        printf( "Case %d:\n", iii );
        max_v.writeln;
        max_w.writeln;
    }
}