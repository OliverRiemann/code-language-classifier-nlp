import std.stdio;
import std.string;
import std.conv;
import std.algorithm;

string Sorting_String(string s) {
    char[] str;
    for (int i = 0; i < s.length; i++)
        str ~= s[i];
    for (int i = 0; i < str.length; i++)
        for (int j = i + 1; j < str.length; j++) {
            if (str[i] > str[j]) {
                auto tmp = str[i];
                str[i] = str[j];
                str[j] = tmp;
            }
        }
    
    return to!string(str);
}

int Change_To_Int(string s) {
    int res = 0;
    for (int i = 1; i < s.length; i++)
        res += ((to!int(s[i]) - 48) * ((10 ^^ i) / 10));
    
    return res;
}

int Reverse_To_Int(string s) {
    char[] str;
    str ~= " ";
    for (int i = 1; i < s.length; i++)
        str ~= s[s.length - i];
    int res = Change_To_Int(to!string(str));
    
    return res;
}

int main()
{
    int N;
    N = readln().chomp().to!int();
    
    for (int i = 0; i < N; i++) {
        string s = readln();
        auto str = Sorting_String(s);
        int num1 = Change_To_Int(str);
        int num2 = Reverse_To_Int(str);
        int ans = num1 - num2;
        writeln(ans);
    }

    return 0;
}