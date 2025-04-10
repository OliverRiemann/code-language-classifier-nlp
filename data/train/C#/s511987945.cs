
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

class Program
{
    void Calc()
    {
        var sc = new Scanner();
        int[] asano = new int[10];
        for (int i = 0; i < 10; i++)
        {
            int a = sc.NextInt();
            asano[i] =  a;
        }
        Array.Sort(asano);
        Console.WriteLine(asano[9]);
        Console.WriteLine(asano[8]);
        Console.WriteLine(asano[7]);
    }

    static void Main()
    {
        new Program().Calc();
    }

    class Scanner
    {
        string[] s = new string[0];
        int i = 0;
        char[] cs = new char[] { ' ' };

        public string Next()
        {
            if (i < s.Length) return s[i++];
            s = Console.ReadLine().Split(cs, StringSplitOptions.RemoveEmptyEntries);
            i = 0;
            return s[i++];
        }
        public int NextInt() { return int.Parse(Next()); }
        public long NextLong() { return long.Parse(Next()); }
        public double NextDouble() { return double.Parse(Next()); }
    }
}