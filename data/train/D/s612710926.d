import std.stdio, std.string, std.conv;
import std.array, std.algorithm, std.range;

immutable int[2][][3] D =
[
    [[1,0],[0,0],[2,0],[1,1],[1,-1]],
    [[1,1],[0,0],[0,1],[0,2],[1,0],[1,2],[2,0],[2,1],[2,2]],
    [[2,0],[0,0],[1,-1],[1,0],[1,1],[2,-2],[2,-1],[2,1],[2,2],[3,-1],[3,0],[3,1],[4,0]],
];
void main()
{
    immutable N = 10;
    immutable M = readln().chomp().to!int();
    auto m = iota(N).map!(_=>readln().split().map!(to!int).array()).array();
    int[3][] r;
    bool check(int x, int y)
    {
        return 0<=x && x<N && 0<=y && y<N && m[y][x]>0;
    }
    bool dfs(int x, int y)
    {
        if(y>=N) return false;
        if(x>=N) return dfs(0,y+1);
        if(m[y][x]==0) return dfs(x+1,y);
        foreach_reverse(i,d;D)
        {
            bool f=true;
            foreach(v;d)
                if(!check(x+v[1],y+v[0]))
                {
                    f=false;break;
                }
            if(!f) continue;
            foreach(v;d) --m[y+v[0]][x+v[1]];
            r~=[x+d[0][1],y+d[0][0],i.to!int()+1];
            if(r.length<M)
            {
                if(dfs(x,y)) return true;
            }
            else
            {
                if(m.map!(a=>a.reduce!"a+b"()).reduce!"a+b"()==0)
                    return true;
            }
            r.popBack();
            foreach(v;d) ++m[y+v[0]][x+v[1]];
        }
        return false;
    }
    dfs(0,0);
    foreach(a;r)
        a.to!(int[]).map!(to!string).join(" ").writeln();
}