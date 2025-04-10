using System;
using System.Collections.Generic;
using System.Linq;

namespace CSharpSample01
{

    class Program
    {

        static void Triangle(int a, int b, int c)
        {
            int[] data =  { a, b, c};

            Array.Sort(data);

            if(Math.Pow(data[0], 2) + Math.Pow(data[1], 2) == Math.Pow(data[2], 2))
            {
                Console.WriteLine("YES");
            }
            else
            {
                Console.WriteLine("NO");
            }
    
        }

        
        static void Main(string[] args)
        {

            int n = int.Parse(Console.ReadLine());
            string[] input;

            int a = 0;
            int b = 0;
            int c = 0;

            for(int i = 0; i < n; i++)
            {
                input= Console.ReadLine().Split(' ');

                a = int.Parse(input[0]);
                b = int.Parse(input[1]);
                c = int.Parse(input[2]);

                Triangle(a, b, c);

            }


        }
    }
}

