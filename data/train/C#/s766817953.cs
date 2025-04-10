using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Study0001
{
    class Program
    {
        static void Main(string[] args)
        {
            int inputNum = int.Parse(Console.ReadLine());

            var inputs = new List<string>();
            for (int i = 0; i < inputNum; i++)
            {
                inputs.Add(Console.ReadLine());
            }

            foreach (var input in inputs)
            {
                var parts = input.Split(' ');
                int a = int.Parse(parts[0]);
                int b = int.Parse(parts[1]);
                int c = int.Parse(parts[2]);

                bool ischeck = false;
                if (a >= b && a >= c)
                {
                    ischeck = a * a == b * b + c * c;
                }
                else if (b >= c && b >= a)
                {
                    ischeck = b * b == a * a + c * c;
                }
                else if (c >= a && c >= b)
                {
                    ischeck = c * c == a * a + b * b;
                }

                if (ischeck)
                {
                    Console.WriteLine("YES");
                }
                else
                {
                    Console.WriteLine("NO");
                }
            }

            //Console.ReadLine();
        }
    }
}