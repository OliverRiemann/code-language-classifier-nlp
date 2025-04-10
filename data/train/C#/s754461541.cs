using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Digit_Number
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                string s = Console.ReadLine();
                if (s == null)
                {
                    break;
                }
                string[] input = s.Split(' ');

                int num1 = int.Parse(input[0]);
                int num2 = int.Parse(input[1]);
                int temp = num1 + num2;
                if (temp >= 1000000)
                {
                    Console.WriteLine(7);
                }
                else if (temp >= 100000 && temp <= 999999)
                {
                    Console.WriteLine(6);
                }
                else if (temp >= 10000 && temp <= 99999)
                {
                    Console.WriteLine(5);
                }
                else if (temp >= 1000 && temp <= 9999)
                {
                    Console.WriteLine(4);
                }
                else if (temp >= 100 && temp <= 999)
                {
                    Console.WriteLine(3);
                }
                else if (temp >= 10 && temp <= 99)
                {
                    Console.WriteLine(2);
                }
                else
                {
                    Console.WriteLine(1);
                }
            }
        }
    }
}

