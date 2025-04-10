import std.stdio, std.string, std.conv;
import std.array, std.algorithm, std.range;
import std.math;

private{
alias real F;
bool eq(F[] a, F[] b){ return a[0]==b[0] && a[1]==b[1]; }
F norm2(F[] a){ return a[0]^^2+a[1]^^2; }
F dist2(F[] a, F[] b){ return (a[0]-b[0])^^2+(a[1]-b[1])^^2; }
F cross(F[] a, F[] b){ return a[0]*b[1]-b[0]*a[1]; }
F[] circumcenter(F[] a, F[] b, F[] c)
{
    F[] vb = [2*(b[0]-a[0]),2*(c[0]-a[0])];
    F[] vc = [2*(b[1]-a[1]),2*(c[1]-a[1])];
    F[] vd = [norm2(a)-norm2(b),norm2(a)-norm2(c)];
    F cbc = cross(vb,vc);
    return [cross(vc,vd)/cbc, cross(vd,vb)/cbc];
}
}

void main()
{
    for(int n; 0!=(n=readln().chomp().to!int()); )
    {
        auto ps = iota(n).map!(_=>readln().chomp().split(",").map!(to!F).array()).array();
        auto s = new bool[][](n,n);
        foreach(i;0..n-1)
            foreach(j;i+1..n)
                if(!eq(ps[i],ps[j]) && dist2(ps[i],ps[j])<=4)
                    s[i][j]=s[j][i]=true;
        size_t m=1;
        foreach(i;0..n-1) foreach(j;i+1..n)
        {
            {
                auto c = [(ps[i][0]+ps[j][0])/2,(ps[i][1]+ps[j][1])/2];
                m=max(m,ps.count!(p=>dist2(p,c)<=1)());
            }
            if(!s[i][j]) continue;
            m=max(m,2);
            foreach(k;j+1..n) if(s[i][k]&&s[j][k])
            {
                auto c = circumcenter(ps[i],ps[j],ps[k]);
                m=max(m,ps.count!(p=>dist2(p,c)<=1)());
            }
        }
        writeln(m);
    }
}