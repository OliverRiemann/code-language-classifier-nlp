import std.stdio, std.string, std.conv, std.algorithm, std.numeric;
import std.range, std.array, std.math, std.typecons, std.container, core.bitop;


void main() {
    string s;
    scan(s);
    writeln(s.retro());
}



void scan(T...)(ref T args) {
    string[] line = readln.split;
    foreach (ref arg; args) {
        arg = line.front.to!(typeof(arg));
        line.popFront();
    }
    assert(line.empty);
}



void fillAll(R, T)(ref R arr, T value) {
    static if (is(typeof(arr[] = value))) {
        arr[] = value;
    }
    else {
        foreach (ref e; arr) {
            fillAll(e, value);
        }
    }
}



struct Queue(T) {
    private {
        int N, head, tail;
        T[] data;
    }

    this(int n) {
        N = n + 1;
        data = new T[](N);
    }

    bool empty() {
        return head == tail;
    }

    bool full() {
        return (tail + 1) % N == head;
    }

    T front() {
        return data[head];
    }

    void push(T x) {
        assert(!full);
        data[tail++] = x;
        tail %= N;
    }

    void pop() {
        assert(!empty);
        head = (head + 1) % N;
    }

    void clear() {
        head = tail = 0;
    }
}