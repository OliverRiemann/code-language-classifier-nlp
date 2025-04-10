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
            int a = 0;
            int b = 0;
            int c = 0;

            for (int i = 0; i < 10; i++)
            {
                int h = int.Parse(Console.ReadLine());
                if (h > c)
                {
                    if (h > b)
                    {
                        if (h > a)
                        {
                            int tmp1 = a;
                            int tmp2 = b;
                            a = h;
                            b = tmp1;
                            c = tmp2;
                        }
                        else
                        {
                            int tmp = b;
                            b = h;
                            c = tmp;
                        }
                    }
                    else
                    {
                        c = h;
                    }
                }

            }

            Console.WriteLine(a);
            Console.WriteLine(b);
            Console.WriteLine(c);


        }

    }
        
}