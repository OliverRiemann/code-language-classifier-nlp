import std.stdio;
import std.ascii;
import std.range;
import std.array;
import std.functional;
import std.algorithm;
import std.conv;
import std.container;
import std.math;
import std.numeric;
import std.string;
import std.c.string;
import std.random;
import std.regex;
import std.typecons;


/* MInt : 閾ェ蜍輔〒MOD繧偵→繧区紛謨ー.
 *   菴ソ縺?→縺阪?邨先ァ矩?縺?ョ壽焚縺御ケ励ｋ縺薙→縺ォ縺ェ繧九?縺ァ豕ィ諢? */
const long MOD = long.max / 2;
struct MInt {
    long v;
    this(long v) {
        if (v < 0) v += ((-v) / MOD + 1) * MOD;
        if (v >= MOD) v %= MOD;
        this.v = v;
    }
    bool opEquals()(long x) const { return this.v == x; }
    bool opEquals()(auto ref const MInt x) const { return this.v == x.v; }
    long opCast(string type)() const { static if (type == "long") { return v; } }
    //@property long toLong() const { return v; }
    //alias toLong this; /* 繝舌げ蝓九ａ霎シ縺ソ縺昴≧縺ェ縺ョ縺ァ豸医＠縺ィ縺?*/
    string toString() const { return to!string(v); }
    MInt opAssign(long x) { this.v = MInt(x).v; return this; }
    MInt opAssign(in MInt x) { this.v = x.v; return this; }
    MInt opOpAssign(string op)(in MInt x) {
        static if (op == "+") { this.v = (this.v + x.v) % MOD; return this; }
        else if (op == "-") { this.v = (this.v + MOD - x.v) % MOD; return this; }
        else if (op == "*") { this.v = (this.v * x.v) % MOD; return this; }
    }
    MInt opUnary(string op)() const {
        static if (op == "-") { return MInt(MOD - this.v); }
    }
    MInt opBinary(string op)(long x) const {
        return mixin("this " ~ op ~ "MInt(x)");
    }
    MInt opBinary(string op)(in MInt x) const {
        static if (op == "+") {
            return MInt(this.v + x.v);
        } else if (op == "-") {
            return this + (-x);
        } else if (op == "*") {
            return MInt(this.v * x.v);
        } else if (op == "/") {
            return this * x.inverse;
        }
    }
    static long extgcd(long a, long b, ref long x, ref long y) {
        long g = a; x = 1; y = 0;
        if (b != 0) {
            g = extgcd(b, a % b, y, x);
            y -= (a / b) * x;
        }
        return g;
    }
    MInt inverse() const {
        long x, y;
        if (extgcd(this.v, MOD, x, y) == 1) return MInt(x + MOD);
        return MInt(0);
    }
}

MInt fact(MInt x) {
    if (x == 0) return MInt(1);
    return x * fact(x - 1);
}

void main() {
    long N; scanf("%lld\n", &N);
    writeln(fact(MInt(N)));
}