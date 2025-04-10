import std.stdio,
       std.string,
       std.conv,
       std.algorithm,
       std.array;

void main() {
    while(1) {
        auto x = readln.split.map!(x=>x.to!int).array;
        if(x == [0, 0, 0, 0])
            return;

        bool f = false;
loop:    foreach(i; 0 .. 4) {
            foreach(j; 0 .. 4) {
                if(j == i)
                    continue;
                foreach(k; 0 .. 4) {
                    if(k == i || k == j)
                        continue;
                    foreach(l; 0 .. 4) {
                        if(l == i || l == j || l == k)
                            continue;
                        auto a = [x[i], x[j], x[k], x[l]];
                        f = a.solve;
                        if(f)
                            break loop;
                    }
                }
            }
        }
        if(!f)
            0.writeln;
    }
}

bool solve(int[] a) {
    immutable ops = ['+', '-', '*'];
    foreach(x; ops) {
    foreach(y; ops) {
    foreach(z; ops) {
        char[] op = [x, y, z];
        if(calc1(a, op) == 10) {
                writefln("((%d %c %d) %c %d) %c %d", a[0], op[0], a[1], op[1], a[2], op[2], a[3]);
                return true;
        } else if(calc2(a, op) == 10) {
                writefln("(%d %c %d) %c (%d %c %d)", a[0], op[0], a[1], op[1], a[2], op[2], a[3]);
                return true;
        }
    }}}
    return false;
}

int calc1(int[] a, char[] op) {
    return sub_calc(sub_calc(sub_calc(a[0], op[0], a[1]), op[1], a[2]), op[2], a[3]);
}


int calc2(int[] a, char[] op) {
    return sub_calc(sub_calc(a[0], op[0], a[1]), op[1], sub_calc(a[2], op[2], a[3]));
}

int sub_calc(int a, char op, int b) {
    switch(op) {
        case '+':
            return a + b;
            break;
        case '-':
            return a - b;
            break;
        case '*':
            return a * b;
            break;
        default:
            throw new Exception("error");
            break;
    }
}