using System;
using System.Collections.Generic;
using System.Linq;

class Problem0004
{
    static void Main(string[] args)
    {
        var xyPairs =
            GetInputLines()
            .Select(line => line.Split().Select(word => double.Parse(word)).ToArray())
            .Select(abcdef => Solve(abcdef));
        foreach (double[] xy in xyPairs)
        {
            Console.WriteLine(xy[0].ToString("F3") + " " + xy[1].ToString("F3"));
        }
    }

    static double[] Solve(double[] abcdef)
    {
        double a = abcdef[0];
        double b = abcdef[1];
        double c = abcdef[2];
        double d = abcdef[3];
        double e = abcdef[4];
        double f = abcdef[5];
        double x = (c * e - b * f) / (a * e - b * d);
        double y = (c * d - a * f) / (b * d - a * e);
        return new double[] { x, y };
    }

    static IEnumerable<string> GetInputLines()
    {
        string line;
        while (!string.IsNullOrEmpty(line = System.Console.ReadLine()))
        {
            yield return line;
        }
    }
}