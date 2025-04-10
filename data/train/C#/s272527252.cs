using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace P0003_Is_it_a_Right_Triangle
{
    class Program
    {
        static void Main(string[] args)
        {

            List<string> lines = new List<string>();

            int cntLine = int.Parse(Console.ReadLine());

            for(int i = 1; i <= cntLine; i++)
            {
                lines.Add(Console.ReadLine());
            }          

            foreach (string line in lines)
            {
                List<string> sidesStr = line.Split(' ').ToList<string>();
                List<int> sides = new List<int>();

                foreach (string sideStr in sidesStr)
                {
                    sides.Add(int.Parse(sideStr));
                }

                sides.Sort();

                if (Math.Pow(sides[2], 2) == Math.Pow(sides[0], 2) + Math.Pow(sides[1], 2))
                {
                    Console.WriteLine("YES");
                }
                else
                {
                    Console.WriteLine("NO");
                }

            }


        }
    }
}