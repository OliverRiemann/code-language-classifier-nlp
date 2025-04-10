import std.stdio, std.string, std.conv;
import std.array, std.algorithm, std.range;
import std.math, std.format;

alias real F;

F area(F x1, F y1, F x2, F y2, F x3, F y3)
{
    return abs(x1*(y2-y3)+x2*(y3-y1)+x3*(y1-y2))/2;
}
F distance(F x1, F y1, F x2, F y2)
{
    return hypot(x1-x2,y1-y2);
}
F cross(F x1, F y1, F x2, F y2)
{
    return x1*y2-y1*x2;
}
F norm2(F x, F y)
{
    return x*x+y*y;
}

string r3(F v){ return format("%.3f",round(v*10^^3)/10^^3+0); }

void main()
{
    foreach(_;0..readln().chomp().to!int())
    {
        auto m = readln().split().map!(to!F);
        immutable x1=m[0], y1=m[1], x2=m[2], y2=m[3], x3=m[4], y3=m[5];
        immutable ax=2*(x2-x1), ay=2*(x3-x1);
        immutable bx=2*(y2-y1), by=2*(y3-y1);
        immutable cx=norm2(x1,y1)-norm2(x2,y2),
                  cy=norm2(x1,y1)-norm2(x3,y3);
        immutable x = cross(bx,by,cx,cy)/cross(ax,ay,bx,by);
        immutable y = cross(cx,cy,ax,ay)/cross(ax,ay,bx,by);
        immutable a = distance(x2,y2,x3,y3);
        immutable b = distance(x3,y3,x1,y1);
        immutable c = distance(x1,y1,x2,y2);
        immutable R = a*b*c/(area(x1,y1,x2,y2,x3,y3)*4);
        writeln(r3(x)," ",r3(y)," ",r3(R));
    }
}