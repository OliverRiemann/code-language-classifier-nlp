using System;
using System.Collections.Generic;
using System.Linq;

class Program {
    static string ReadLine() { return Console.ReadLine(); }
    static int ReadInt() { return int.Parse(ReadLine()); }
    static int[] ReadInts() { return ReadLine().Split().Select(int.Parse).ToArray(); }
    static string[] ReadStrings() { return ReadLine().Split(); }


    static float Scala(float a, float b, float c, float d) {
        return a * d - b * c;
    }

    // ax + by = c
    // dx + ey = f
    static void Calc(float a, float b, float c, float d, float e, float f) {
        var nume = Scala(a, b, d, e);

        var xd = Scala(c, b, f, e);
        var yd = Scala(a, c, d, f);

        var x = xd / nume;
        var y = yd / nume;
        Console.WriteLine("{0:f3} {1:f3}", x, y);
    }

    static void Main() {
        string s;
        while ((s = ReadLine()) != null) {
            var xs = s.Split().Select(int.Parse).ToArray();
            Calc(xs[0], xs[1], xs[2], xs[3], xs[4], xs[5]);
        }
    }
}