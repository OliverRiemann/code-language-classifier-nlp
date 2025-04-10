import std.stdio;
//import std.string;
import std.array;
import std.algorithm;
import std.regex;
import std.container : SList;

void main() {
    char[] str;
    while((str = readln().dup).length != 0) {
        char[] ans = resolve(str);
        write(ans);
    }
}

char[] resolve(char[] str) {
    for (int c = 0; c < 'z'-'a' + 1; ++c) {
        for (int i = 0; i < str.length; ++i) {
            if ('a' <= str[i] && str[i] <= 'z') {
                if (str[i] == 'z') {
                    str[i] = 'a';
                } else {
                    str[i] += 1;
                }
            }
        }
        char[][] sxx = split(str);
        //if (contains_any(sxx, "the".dup, "this".dup, "that".dup)) {
        if (my_match(cast(immutable)str)) {
            break;
        }
    }
    return str;
}

bool my_match(string str) {
    if (match(str, r"the|this|that")) {
        return true;
    }
    return false;
}

bool contains_any(T, U...)(T[] arr, U elms) {
    foreach(elm ; elms) {
        if (!find(arr, elm).empty) {
            return true;
        }
    }
    return false;
}