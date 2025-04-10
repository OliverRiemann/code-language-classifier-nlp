import std.stdio;
import std.conv;
import std.algorithm;
import std.string;
import std.file;
import std.math;
 
int main() {
        string l;
        readln();
        while((l = readln(), l.length)){
                l = l.split("\n")[0];
                float x1, y1, x2, y2, x3, y3;
                x1 = to!float(l.split[0]), y1 = to!float(l.split[1]);
                x2 = to!float(l.split[2]), y2 = to!float(l.split[3]);
                x3 = to!float(l.split[4]), y3 = to!float(l.split[5]);
                float a, b, c, d, e, f;
                a = 2 * (x1 - x2), b = 2 * (y1 - y2), c = (x1 + x2) * (x1 - x2) + (y1 + y2) * (y1 - y2);
                d = 2 * (x1 - x3), e = 2 * (y1 - y3), f = (x1 + x3) * (x1 - x3) + (y1 + y3) * (y1 - y3);                
                float px, py, r;
                px = c / (a - d * b / e) - f / (a * e / b - d), py = c / (b - e * a / d) - f / (b * d / a - e);
                r = sqrt((x1 - px) * (x1 - px) + (y1 - py) * (y1 - py));
/*              px = to!float(to!int(px * 1000)) / 1000, py = to!float(to!int(py * 1000)) / 1000;
                r = to!float(to!int(r * 1000)) / 1000;
*/              printf("%.3f %.3f %.3f\n", px, py, r);
                }
        return 0;
        }
 