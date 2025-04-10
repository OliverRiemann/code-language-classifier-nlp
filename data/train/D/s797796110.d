import std.stdio;
import std.array;
import std.conv;


void main()
{
    auto op = ['+', '-', '*'];
    
    while (true) {
        auto flag = false;
        auto num = readln.split.to!(int[]);
        if (num[] == [0, 0, 0, 0]) break;
        
    loop:
        foreach (i; 0..3) {
            foreach (j; 0..3) {
                foreach (k; 0..3) {
                    foreach (a; 0..4) {
                        foreach (b; 0..4) {
                            if (b == a) continue;
                            foreach (c; 0..4) {
                                if (c == a || c == b) continue;
                                foreach (d; 0..4) {
                                    if (d == a || d == b || d == c) continue;
                                    if (cal(k, cal(j, cal(i, num[a], num[b]), num[c]), num[d]) == 10) {
                                        writefln("(((%d %c %d) %c %d) %c %d)", num[a], op[i], num[b], op[j], num[c], op[k], num[d]);
                                        flag = true;
                                        break loop;
                                    }
                                    if (cal(k, cal(i, num[a], cal(j, num[b], num[c])), num[d]) == 10) {
                                        writefln("((%d %c (%d %c %d)) %c %d)", num[a], op[i], num[b], op[j], num[c], op[k], num[d]);
                                        flag = true;
                                        break loop;
                                    }
                                    if (cal(i, num[a], cal(j, num[b], cal(k, num[c], num[d]))) == 10) {
                                        writefln("(%d %c (%d %c (%d %c %d)))", num[a], op[i], num[b], op[j], num[c], op[k], num[d]);
                                        flag = true;
                                        break loop;
                                    }
                                    if (cal(i, num[a], cal(k, cal(j, num[b], num[c]), num[d])) == 10) {
                                        writefln("(%d %c ((%d %c %d) %c %d))", num[a], op[i], num[b], op[j], num[c], op[k], num[d]);
                                        flag = true;
                                        break loop;
                                    }
                                    if (cal(j, cal(i, num[a], num[b]), cal(k, num[c], num[d])) == 10) {
                                        writefln("((%d %c %d) %c (%d %c %d))", num[a], op[i], num[b], op[j], num[c], op[k], num[d]);
                                        flag = true;
                                        break loop;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        if (!flag) writeln(0);
    }
}


int cal(const int op, const int n1, const int n2)
{
    switch (op) {
    case 0:
        return n1 + n2;
        break;
    case 1:
        return n1 - n2;
        break;
    case 2:
        return n1 * n2;
        break;
    default:
        writeln("ERROR!");
        return 0;
        break;
    }
}