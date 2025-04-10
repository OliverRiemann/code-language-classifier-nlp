import std.stdio, std.conv, std.array, std.algorithm, std.string, std.math;

void main() {
    string s;
    while ((s = readln()).length != 0) {
        int[] nx;
        if (to!uint(s.chomp) == 0) {break;}
        for (uint i = 0; i < to!uint(s.chomp); ++i) {
            nx ~= to!int(readln().chomp);   
        }
        writeln(solve(nx));
    }
}

int solve(int[] tx) {
    if (negative_all(tx)) {
        int max = -100000;
        foreach(n ; tx) {
            if (n > max) {
                max = n;   
            }
        }
        return max;
    }
    
    int[] nx = reduce_by_sign(tx);
    
    if (nx.length == 1)      { return nx[0]; }
    
    if (nx[0] < 0)           { nx = nx[1..(nx.length)]; }
    if (nx[nx.length-1] < 0) { nx = nx[0..(nx.length-1)]; }

    /*for (uint i = 0; i < nx.length; ++i) {
        if (nx[i] < 0) {
            if (nx[i-1] >= abs(nx[i]) && nx[i+1] >= abs(nx[i])) {
                int t = nx[i-1] + nx[i] + nx[i+1];
                if (i+2 < nx.length) {
                    nx = nx[0..i-1] ~ [t] ~ nx[i+2..nx.length];
                } else {
                    nx = nx[0..i-1] ~ [t];
                }
            }
        }
    }

    int max = 0;
    foreach(n ; nx) {
        if (max < n) {
           max = n;   
        }
    }*/
    int max = nx[0];
    for (uint i = 0; i < nx.length; ++i) {
        int max_ = nx[i];
        int acc = max_;
        for (uint j = i+1; j < nx.length; ++j) {
            acc = acc + nx[j];
            if (acc > max_) { max_ = acc; }
        }
        if (max_ > max) { max = max_; }
    }
    
    return max;
}

bool negative_all(int[] nx) {
    foreach(n ; nx) {
        if (n > 0) {
            return false;
        }
    }
    return true;
}

int[] reduce_by_sign(int[] nx) {
    bool sign = (nx[0] >= 0);
    uint index = 0;
    int[] ret = [nx[0]];
    
    for (uint i = 1; i < nx.length; ++i) {
        if (sign != (0 <= nx[i])) {
            sign = !sign;
            ret ~= 0;
            ++index;
        }
            
        ret[index] += nx[i];
    }
    return ret;
}