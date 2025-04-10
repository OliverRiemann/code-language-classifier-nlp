import std.algorithm;
import std.array;
import std.conv;
import std.math;
import std.range;
import std.stdio;
import std.string;
import std.typecons;

T read(T)() { return readln.chomp.to!T; }
T[] reads(T)() { return readln.split.to!(T[]); }
alias readint = read!int;
alias readints = reads!int;

int calc(int n, int s) {
    int ans = 0;
    foreach (e; combinations(iota(10).array, n)) {
        if (e.sum == s)
            ans++;
    }
    return ans;
}

void main() {
    while (true) {
        auto xs = readints;
        int n = xs[0], s = xs[1];

        if (n == 0 && s == 0) break;
        writeln(calc(n, s));
    }
}

Combinations!T combinations(T)(T[] xs, int n) {
    return Combinations!T(xs, n);
}

struct Combinations(T) {
    private T[] _source;
    private int _n;
    private T[][] _q;
    private int _state;

    this(T[] source, int n) {
        _source = source.dup;
        _n = n;
        _state = 0;

        pushNext();
    }

    @property T[] front() {
        return _q[0];
    }

    void popFront() {
        _q = _q[1..$];
        pushNext();
    }

    bool empty() {
        return _q.length == 0;
    }

    private void pushNext() {
        int len = cast(int)_source.length;
        while (_state < (1 << len)) {
            int[] buf;
            for (int j = 0; j < len; j++) {
                if (_state & (1 << j)) {
                    buf ~= _source[j];
                    if (buf.length > _n) break;
                }
            }

            _state++;
            if (buf.length == _n) {
                _q ~= buf;
                return;
            }
        }
    }
}

