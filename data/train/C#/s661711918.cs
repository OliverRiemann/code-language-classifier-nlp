using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Diagnostics;

namespace test
{

    class Program
    {
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());
            List<string> list = new List<string>();

            for (int i = 0; i < n; i++)
            {
                string[] s = Console.ReadLine().Split(' ');
                List<int> triangle = new List<int>();

                foreach (string st in s)
                {
                    triangle.Add(int.Parse(st));
                }

                triangle.Sort();

                list.Add(JudgeTriangle(triangle));
            }

            foreach (string s in list)
            {
                Console.WriteLine(s);
            }

        }

        static string JudgeTriangle(List<int> l)
        {
            if (l[2] * l[2] == l[1] * l[1] + l[0] * l[0])
            {
                return "YES";
            }
            else
            {
                return "NO";
            }

        }

    }
        
}