using System;
using System.Collections.Generic;
using System.Linq;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Judge judge = new Judge();

            List<string> ans = new List<string>();

            int n = int.Parse(Console.ReadLine());

            for (int i = 0; i < n;  i++)
            {
                List<int> length = Console.ReadLine().Split(' ').Select(int.Parse).ToList();
                int max = length.Max();
                length.Remove(max);

                ans.Add(judge.Calc(max, length));
            }

            foreach (string item in ans)
            {
                Console.WriteLine(item);
            }
        }
    }

    class Judge
    {
        internal string Calc(int max, List<int> length)
        {
            string ans;

            double leftside = Math.Pow(max, 2);
            double rightside = Math.Pow(length[0], 2) + Math.Pow(length[1], 2);

            if (leftside == rightside)
            {
                ans = "YES";
            }
            else
            {
                ans = "NO";
            }

            return ans;
        }
        
    }
}

