using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

class Program
{
    void Calc()
    {
        var sc = new Scanner();

        var a = sc.NextInt();
        for (int i = 0; i < a; i++)
        {
            int b = sc.NextInt();
            int c = sc.NextInt();
            int d = sc.NextInt();
            int[] kasatomo = new int[3];
            kasatomo[0] = b;
            kasatomo[1] = c;
            kasatomo[2] = d;
            Array.Sort(kasatomo);
            if (kasatomo[0] * kasatomo[0] + kasatomo[1] * kasatomo[1] == kasatomo[2] * kasatomo[2])
            {
                Console.WriteLine("YES");
            }
            else
            {
                Console.WriteLine("NO");
            }
        }
        /*
        if (a > 0)
        {
            w = true;
            while (w == true)
            {
                int b = sc.NextInt();
                int c = sc.NextInt();
                int d = sc.NextInt();
                a = a--;

                if (b * b + c * c == d * d)
                {
                    Console.WriteLine("YES");
                }
                else
                {
                    Console.WriteLine("NO");
                }
            }
        }
        else
        {
            w = false;
        }*/
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