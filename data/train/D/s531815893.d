import std.stdio, std.string, std.conv, std.algorithm;


void main()
{
    int[][] dp = new int[][](1001, 10001);

    int cases = 1;
    while(true)
    {
        int w = readln.chomp.to!int;
        if(!w)break;
        int n = readln.chomp.to!int;
        int[1001] treValue, treWeit;
        foreach(i; 1 .. n + 1)
        {
            auto f = readln.chomp.split(",").map!(to!int);
            treValue[i] = f[0];
            treWeit[i] = f[1];
        }
        foreach(i; 1 .. n + 1)
        {
            foreach(j; 1 .. w + 1)
            {
                if(treWeit[i] > j || dp[i - 1][j - treWeit[i]] + treValue[i] <= dp[i - 1][j])
                {
                    dp[i][j] = dp[i - 1][j];
                }
                else
                {
                    dp[i][j] = dp[i - 1][j - treWeit[i]] + treValue[i];
                }
            }
        }
        int maxValue = int.min, minWeit;
        foreach(i; 1 .. w + 1)
        {
            if(dp[n][i] > maxValue)
            {
                maxValue = dp[n][i];
                minWeit = i;
            }
        }
        writeln("Case ", cases, ":");
        maxValue.writeln;
        minWeit.writeln;
        ++cases;
    }
}