using System.Linq;
using System.Collections.Generic;
using System;

namespace AOJ
{
    class Program
    {
        static void Main(string[] args)
        {
            var result = Volume0.IsItARightTriangle();
            System.Diagnostics.Trace.WriteLine(result);
            Console.WriteLine(result);
        }
    }

    public static class Volume0
    {
        public static string IsItARightTriangle()
        {
            var count = int.Parse(Console.ReadLine());
            var result = new List<string>();
            foreach (var i in Enumerable.Range(1, count))
            {
                var inputs = Console.ReadLine().Split(' ').Select(x => int.Parse(x)).OrderByDescending(x => x).ToArray();
                if (Math.Pow(inputs[0], 2) == Math.Pow(inputs[1], 2) + Math.Pow(inputs[2], 2))
                {
                    result.Add("YES");
                }
                else
                {
                    result.Add("NO");
                }
                
            }
            return string.Join("\n", result.ToArray());
        }
    }
}