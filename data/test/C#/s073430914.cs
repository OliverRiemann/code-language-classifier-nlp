using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AOJ
{
    class Program
    {
        static void Main(string[] args)
        {
            Solver solver = new Solver();
            solver.solve();
            return;
        }
    }

    class Solver
    {
        public Solver()
        {
            /* Here Initialize */
        }

        public void solve()
        {
            for (int i = 1; i < 10; i++)
                for (int j = 1; j < 10; j++)
                    Console.WriteLine(i + "x" + j + "=" + (i * j));
        }

        static String rs() { return Console.ReadLine(); }
        static int ri() { return int.Parse(Console.ReadLine()); }
        static long rl() { return long.Parse(Console.ReadLine()); }
        static double rd() { return double.Parse(Console.ReadLine()); }
        static String[] rsa() { return Console.ReadLine().Split(' '); }
        static int[] ria() { return Array.ConvertAll(Console.ReadLine().Split(' '), e => int.Parse(e)); }
        static long[] rla() { return Array.ConvertAll(Console.ReadLine().Split(' '), e => long.Parse(e)); }
        static double[] rda() { return Array.ConvertAll(Console.ReadLine().Split(' '), e => double.Parse(e)); }
    }

}