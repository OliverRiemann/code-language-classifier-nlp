import std.stdio, std.string, std.conv;
import std.array, std.algorithm, std.range;

void main()
{
    foreach(s;stdin.byLine())
    {
        int[10] c; foreach(n;s) ++c[n-'0'];
        bool dfs(int n, bool d)
        {
            if(n>9) return d;
            if(c[n]==0) return dfs(n+1,d);
            if(c[n]>=3)
            {
                c[n]-=3;
                auto r = dfs(n,d);
                c[n]+=3;
                if(r) return true;
            }
            if(n<=9-2 && c[n]>0 && c[n+1]>0 && c[n+2]>0)
            {
                foreach(i;0..3) --c[n+i];
                auto r = dfs(n,d);
                foreach(i;0..3) ++c[n+i];
                if(r) return true;
            }
            if(!d && c[n]>=2)
            {
                c[n]-=2;
                auto r = dfs(n,true);
                c[n]+=2;
                if(r) return true;
            }
            return false;
        }
        bool solve(int n)
        {
            if(c[n]>=4) return false;
            ++c[n];
            auto r = dfs(1,false);
            --c[n];
            return r;
        }
        auto a = iota(1,10).filter!solve().map!(to!string).join(" ");
        if(a=="") a="0";
        a.writeln();
    }
}