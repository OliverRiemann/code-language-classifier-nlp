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

string solve(int[] a, int[] b)
{
    if(b is null)
    {
        string c = "+-*";
        foreach(c1;c)
            foreach(c2;c)
                foreach(c3;c)
                {
                    auto w = a.map!(to!string).array();
                    if(10==calc(a[0],c1,calc(a[1],c2,calc(a[2],c3,a[3]))))
                        return w[0]~[c1]~"("~w[1]~[c2]~"("~w[2]~[c3]~w[3]~"))";
                    if(10==calc(a[0],c1,calc(calc(a[1],c2,a[2]),c3,a[3])))
                        return w[0]~[c1]~"(("~w[1]~[c2]~w[2]~")"~[c3]~w[3]~")";
                    if(10==calc(calc(a[0],c1,a[1]),c2,calc(a[2],c3,a[3])))
                        return "("~w[0]~[c1]~w[1]~")"~[c2]~"("~w[2]~[c3]~w[3]~")";
                    if(10==calc(calc(calc(a[0],c1,a[1]),c2,a[2]),c3,a[3]))
                        return "(("~w[0]~[c1]~w[1]~")"~[c2]~w[2]~")"~[c3]~w[3];
                    if(10==calc(calc(a[0],c1,calc(a[1],c2,a[2])),c3,a[3]))
                        return "("~w[0]~[c1]~"("~w[1]~[c2]~w[2]~"))"~[c3]~w[3];
                }
        return [];
    }
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