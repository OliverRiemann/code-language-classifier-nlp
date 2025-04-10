import std.stdio,
       std.string,
       std.conv,
       std.algorithm;

void main() {
    auto flag = true;
    int[][] a, b;
    while(!stdin.eof) {
        auto input = readln.chomp;
        if(input.length) {
            auto arr = function int[](string s) {
                    int[] ret;
                    foreach(c; s) {
                        ret ~= c.to!int - 48;
                    }
                    return ret;
                }(input);
            if(flag)
                a ~= arr, flag = !flag;
            else
                b ~= arr, flag = !flag;
        }
    }

    long h = b.length, w = a[0].length;
    long x = 0, y = 0;
    auto d = 'R';
    while(1) {
        switch(d) {
            case 'R':
                if(y - 1 >= 0 && b[y - 1][x])
                    y--, d = 'U';
                else if(x < w && a[y][x]) {
                    x++;
                }
                else if(y < h && b[y][x])
                    y++, d = 'D';
                else
                    x--, d = 'L';
                break;
            case 'U':
                if(x - 1 >= 0 && a[y][x - 1])
                    x--, d = 'L';
                else if(y - 1 >= 0 && b[y - 1][x])
                    y--;
                else if(x < w && a[y][x])
                    x++, d = 'R';
                else
                    y++, d = 'D';
                break;
            case 'L':
                if(y < h && b[y][x])
                    y++, d = 'D';
                else if(x - 1 >= 0 && a[y][x - 1])
                    x--;
                else if(y - 1 >= 0 && b[y - 1][x])
                    y--, d = 'U';
                else
                    x++, d = 'R';
                break;
            case 'D':
                if(x < w && a[y][x])
                    x++, d = 'R';
                else if(y < h && b[y][x])
                    y++;
                else if(x - 1 >= 0 && a[y][x - 1])
                    x--, d = 'L';
                else
                    y--, d = 'U';
                break;
            default:
                return;
        }
        d.write;
        if(x == 0 && y == 0)
            break;
    }
    writeln;
}