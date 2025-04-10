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
            List<int> outList = new List<int>();
            string input;
            while ((input = Console.ReadLine()) != null)
            {
                string[] array = input.Split(' ');
                int sum = int.Parse(array[0]) + int.Parse(array[1]);
                outList.Add(GetDigit(sum));

            }

            foreach (int n in outList)
            {
                Console.WriteLine(n);
            }

            
        }

        static int GetDigit(int sum)
        {
            int count = 1;
            int i = 1;
            while (true)
            {
                i *= 10;
                if (sum - i < 0)
                {
                    break;
                }

                count++;
            }

            return count;
        }
    }
        
}