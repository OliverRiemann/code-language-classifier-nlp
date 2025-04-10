using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                string a;
                a = Console.ReadLine();
                if (a == null) break;
                string d = "";
                string b = "";
                int c = 0;
                for (int i = 0; i <= a.Length - 1; i++)
                {
                    if (a.Substring(i, 1) != " ")
                    {
                        d = d + a.Substring(i, 1);
                        c += 1;
                    }
                    else
                    {
                        break;
                    }
                }
                for (int i = c + 1; i <= a.Length - 1; i++)
                {
                    b = b + a.Substring(i, 1);
                }
                c = int.Parse(b) + int.Parse(d);
                int z = 0;
                while (c != 0)
                {
                    c = c / 10;
                    z += 1;
                }
                Console.WriteLine(z);
            }
        }
    }
}