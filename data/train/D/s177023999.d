/+ dub.sdl:
    name "A"
    dependency "dcomp" version=">=0.7.4"
+/

import std.stdio, std.algorithm, std.range, std.conv, std.math;
// import dcomp.foundation, dcomp.scanner;

// import dcomp.geo.primitive;

int main() {
    EPS!double = 1e-10;
    alias P = Point2D!double;

    P[] pol;
    while (true) {
        string s;
        if (sc.read(s) != 1) break;
        auto l = s.split(",");
        double x = l[0].to!double;
        double y = l[1].to!double;
        pol ~= P(x, y);
    }

    writefln("%.20f", pol.area2.abs / 2);
    return 0;
}

Scanner sc;
static this() {
    sc = new Scanner(stdin);
}
/* IMPORT /Users/yosupo/Program/dcomp/source/dcomp/scanner.d */
// module dcomp.scanner;

// import dcomp.array;

 
class Scanner {
    import std.stdio : File;
    import std.conv : to;
    import std.range : front, popFront, array, ElementType;
    import std.array : split;
    import std.traits : isSomeChar, isStaticArray, isArray; 
    import std.algorithm : map;
    File f;
    this(File f) {
        this.f = f;
    }
    char[512] lineBuf;
    char[] line;
    private bool succW() {
        import std.range.primitives : empty, front, popFront;
        import std.ascii : isWhite;
        while (!line.empty && line.front.isWhite) {
            line.popFront;
        }
        return !line.empty;
    }
    private bool succ() {
        import std.range.primitives : empty, front, popFront;
        import std.ascii : isWhite;
        while (true) {
            while (!line.empty && line.front.isWhite) {
                line.popFront;
            }
            if (!line.empty) break;
            line = lineBuf[];
            f.readln(line);
            if (!line.length) return false;
        }
        return true;
    }

    private bool readSingle(T)(ref T x) {
        import std.algorithm : findSplitBefore;
        import std.string : strip;
        import std.conv : parse;
        if (!succ()) return false;
        static if (isArray!T) {
            alias E = ElementType!T;
            static if (isSomeChar!E) {
                 
                 
                auto r = line.findSplitBefore(" ");
                x = r[0].strip.dup;
                line = r[1];
            } else static if (isStaticArray!T) {
                foreach (i; 0..T.length) {
                    bool f = succW();
                    assert(f);
                    x[i] = line.parse!E;
                }
            } else {
                FastAppender!(E[]) buf;
                while (succW()) {
                    buf ~= line.parse!E;
                }
                x = buf.data;
            }
        } else {
            x = line.parse!T;
        }
        return true;
    }
    int read(T, Args...)(ref T x, auto ref Args args) {
        if (!readSingle(x)) return 0;
        static if (args.length == 0) {
            return 1;
        } else {
            return 1 + read(args);
        }
    }
}


 
 

 
/* IMPORT /Users/yosupo/Program/dcomp/source/dcomp/array.d */
// module dcomp.array;

 
T[N] fixed(T, size_t N)(T[N] a) {return a;}

 
 

 
struct FastAppender(A, size_t MIN = 4) {
    import std.algorithm : max;
    import std.conv;
    import std.range.primitives : ElementEncodingType;
    import core.stdc.string : memcpy;

    private alias T = ElementEncodingType!A;
    private T* _data;
    private uint len, cap;
     
    @property size_t length() const {return len;}
    bool empty() const { return len == 0; }
     
    void reserve(size_t nlen) {
        import core.memory : GC;
        if (nlen <= cap) return;
        
        void* nx = GC.malloc(nlen * T.sizeof);

        cap = nlen.to!uint;
        if (len) memcpy(nx, _data, len * T.sizeof);
        _data = cast(T*)(nx);
    }
    void free() {
        import core.memory : GC;
        GC.free(_data);
    }
     
    void opOpAssign(string op : "~")(T item) {
        if (len == cap) {
            reserve(max(MIN, cap*2));
        }
        _data[len++] = item;
    }
     
    void insertBack(T item) {
        this ~= item;
    }
     
    void removeBack() {
        len--;
    }
     
    void clear() {
        len = 0;
    }
    ref inout(T) back() inout { assert(len); return _data[len-1]; }
    ref inout(T) opIndex(size_t i) inout { return _data[i]; }
     
    T[] data() {
        return (_data) ? _data[0..len] : null;
    }
}

 
 
/* IMPORT /Users/yosupo/Program/dcomp/source/dcomp/foundation.d */
// module dcomp.foundation;
 
static if (__VERSION__ <= 2070) {
    /*
    Copied by https://github.com/dlang/phobos/blob/master/std/algorithm/iteration.d
    Copyright: Andrei Alexandrescu 2008-.
    License: $(HTTP boost.org/LICENSE_1_0.txt, Boost License 1.0).
    */
    template fold(fun...) if (fun.length >= 1) {
        auto fold(R, S...)(R r, S seed) {
            import std.algorithm : reduce;
            static if (S.length < 2) {
                return reduce!fun(seed, r);
            } else {
                import std.typecons : tuple;
                return reduce!fun(tuple(seed), r);
            }
        }
    }
     
}

import core.bitop : popcnt;
static if (!__traits(compiles, popcnt(ulong.max))) {
    public import core.bitop : popcnt;
    int popcnt(ulong v) {
        return popcnt(cast(uint)(v)) + popcnt(cast(uint)(v>>32));
    }
}

bool poppar(ulong v) {
    v^=v>>1;
    v^=v>>2;
    v&=0x1111111111111111UL;
    v*=0x1111111111111111UL;
    return ((v>>60) & 1) != 0;
}
/* IMPORT /Users/yosupo/Program/dcomp/source/dcomp/geo/primitive.d */
// module dcomp.geo.primitive;

import std.traits;

template EPS(R) {
    R EPS;
}

int sgn(R)(R a) {
    if (a < -EPS!R) return -1;
    if (a > EPS!R) return 1;
    return 0;
}

struct Point2D(T) {
    T[2] d;
    this(T x, T y) {this.d = [x, y];}
    this(T[2] d) {this.d = d;}
    @property ref inout(T) x() inout {return d[0];}
    @property ref inout(T) y() inout {return d[1];}
    ref inout(T) opIndex(size_t i) inout {return d[i];}
    auto opOpAssign(string op)(in Point2D r) {
        return mixin("this=this"~op~"r");
    }
    auto opBinary(string op:"+")(in Point2D r) const {return Point2D(x+r.x, y+r.y);}
    auto opBinary(string op:"-")(in Point2D r) const {return Point2D(x-r.x, y-r.y);}
    static if (isFloatingPoint!T) {
        T abs() {
            import std.math : sqrt;
            return (x*x+y*y).sqrt;
        }
        T arg() {
            import std.math : atan2;
            return atan2(y, x);
        }
        Point2D rot(T ar) {
            import std.math : cos, sin;
            auto cosAr = cos(ar), sinAr = sin(ar);
            return Point2D(x*cosAr - y*sinAr, x*sinAr + y*cosAr);
        }
    }
}

bool near(T)(Point2D!T a, Point2D!T b) if (isIntegral!T) {
    return a == b;
}

bool near(T)(Point2D!T a, Point2D!T b) if (isFloatingPoint!T) {
    return !sgn((a-b).abs);
}

T dot(T)(in Point2D!T l, in Point2D!T r) {
    return l[0]*r[0] + l[1]*r[1];
}

T cross(T)(in Point2D!T l, in Point2D!T r) {
    return l[0]*r[1] - l[1]*r[0];
}


 


int ccw(R)(Point2D!R a, Point2D!R b, Point2D!R c) {
    assert(!near(a, b));
    if (near(a, c) || near(b, c)) return 0;
    int s = sgn(cross(b-a, c-a));
    if (s) return s;
    if (dot(b-a, c-a) < 0) return 2;
    if (dot(a-b, c-b) < 0) return -2;
    return 0;
}


inout(Point2D!R) at(R)(inout Point2D!R[] pol, size_t i) {
    return pol[i<pol.length?i:i-pol.length];
}

 
int contains(R)(Point2D!R[] pol, Point2D!R p) {
    import std.algorithm : swap;
    int res = -1;
    foreach (i; 0..pol.length) {
        auto a = pol.at(i) - p, b = pol.at(i+1) - p;
        if (ccw(a, b, Point2D!R(0, 0)) == 0) return 1;
        if (a.y > b.y) swap(a, b);
        if (a.y <= 0 && 0 < b.y) {
            if (cross(a, b) < 0) res *= -1;
        }
    }
    return res+1;
}

 

R area2(R)(Point2D!R[] pol) {
    R u = 0;
    foreach (i; 0..pol.length) {
        auto a = pol.at(i), b = pol.at(i+1);
        u += cross(a, b);
    }
    return u;
}

 

 
 
int argcmp(T)(Point2D!T l, Point2D!T r) if (isIntegral!T) {
    int sgn(Point2D!T p) {
        if (p[1] < 0) return -1;
        if (p[1] > 0) return 1;
        if (p[0] < 0) return 2;
        return 0;
    }
    int lsgn = sgn(l);
    int rsgn = sgn(r);
    if (lsgn < rsgn) return -1;
    if (lsgn > rsgn) return 1;

    T x = cross(l, r);
    if (x > 0) return -1;
    if (x < 0) return 1;

    return 0;
}


 

/*
This source code generated by dcomp and include dcomp's source code.
dcomp's Copyright: Copyright (c) 2016- Kohei Morita. (https://github.com/yosupo06/dcomp)
dcomp's License: MIT License(https://github.com/yosupo06/dcomp/blob/master/LICENSE.txt)
*/