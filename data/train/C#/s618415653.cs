using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


namespace a
{
    class Program
    {
        static void Main()
        {
            string line;
            while ((line = Console.ReadLine()) != null)
            {

                var ab = line.Split().Select(int.Parse).ToArray();
                int a = ab[0];
                int b = ab[1];
                if ((a + b) / 1000000 >= 1)
                    Console.WriteLine("7");
                else if ((a + b) / 100000 >= 1)
                    Console.WriteLine("6");
                else if ((a + b) / 10000 >= 1)
                    Console.WriteLine("5");
                else if ((a + b) / 1000 >= 1)
                    Console.WriteLine("4");
                else if ((a + b) / 100 >= 1)
                    Console.WriteLine("3");
                else if ((a + b) / 10 >= 1)
                    Console.WriteLine("2");
                else if ((a + b) / 1 >= 1)
                    Console.WriteLine("1");


            }
        }
    }
}