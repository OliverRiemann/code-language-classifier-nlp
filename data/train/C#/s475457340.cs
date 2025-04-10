using System;
using System.Collections.Generic;
using System.Linq;

namespace Problem0003
{
    class Program
    {
        static void Main(string[] args)
        {
            var triples =
                GetInputLines()
                .Skip(1)
                .Select(line => line.Split().Select(word => int.Parse(word)).ToArray());
            foreach (int[] triple in triples)
            {
                if (IsRightTriangle(triple))
                {
                    Console.WriteLine("YES");
                }
                else
                {
                    Console.WriteLine("NO");
                }
            }
        }

        static IEnumerable<string> GetInputLines()
        {
            string line;
            while (!string.IsNullOrEmpty(line = System.Console.ReadLine()))
            {
                yield return line;
            }
        }

        static bool IsRightTriangle(int[] triple)
        {
            int[] sortedTriple = triple.OrderBy(n => n).ToArray();
            int a = sortedTriple[0], b = sortedTriple[1], c = sortedTriple[2];
            return a * a + b * b == c * c;
        }
    }
}