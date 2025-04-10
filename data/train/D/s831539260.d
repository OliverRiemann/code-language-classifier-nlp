import std.stdio, std.string, std.conv;
import std.array, std.algorithm, std.range;

class UnionFind
{
    private int[] p;
    private int[] r;
    this(int n){ p = iota(n).array(); r = new int[n]; }
    int find(int x)
    {
        if(x==p[x]) return x;
        return p[x]=find(p[x]);
    }
    void unite(int x, int y)
    {
        x=find(x);
        y=find(y);
        if(r[x]>r[y]) swap(x,y);
        p[y]=x;
        if(r[x]==r[y]) ++r[y]; 
    }
    bool same(int x, int y){ return find(x)==find(y); }
}

void main()
{
    for(int n; 0!=(n=readln().chomp().to!int()); )
    {
        immutable m = readln().chomp().to!int();
        auto g = iota(m).map!(_=>readln().chomp().split(",").map!(to!int).array()).array()
            .map!(a=>[a[2]/100-1,a[0],a[1]]).array().sort();
        auto uf = new UnionFind(n);
        int c=0;
        foreach(e;g)
        {
            if(uf.same(e[1],e[2])) continue;
            uf.unite(e[1],e[2]);
            c+=e[0];
        }
        writeln(c);
    }
}