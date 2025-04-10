import std.stdio, std.string, std.conv;
import std.array, std.algorithm, std.range;

int calc(int x, char op, int y)
{
    switch(op)
    {
    case '+': return x+y;
    case '-': return x-y;
    case '*':
    default:  return x*y;
    }
}

string dfs(int[] vs, string[] e)
{
    if(vs.length==1) return vs[0]==10?e[0]:[];
    foreach(i;1..vs.length)
        foreach(op;"+-*")
        {
            auto r = dfs(vs[0..i-1]~[calc(vs[i-1],op,vs[i])]~vs[i+1..$],
                         e[0..i-1]~["("~e[i-1]~[op]~e[i]~")"]~e[i+1..$]);
            if(r !is null) return r;
        }
    return [];
}

string solve(int[] a, int[] b)
{
    if(b is null)
        return dfs(a,a.map!(to!string).array());
    foreach(i;0..b.length)
    {
        auto r = solve(a~b[i],b[0..i]~b[i+1..$]);
        if(r !is null)
            return r;
    }
    return [];
}

void main()
{
    foreach(vs;stdin.byLine().map!(s=>s.split().map!(to!int).array())())
    {
        if(vs.all!"a==0"()) break;
        auto r = solve([],vs);
        writeln(r is null?"0":r);
    }
}