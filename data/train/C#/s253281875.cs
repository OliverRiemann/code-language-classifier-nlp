using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
 
namespace aoj
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                string a = "";
                string b = "";
                string c = "";
                int d = 0;
                string k = Console.ReadLine();
                if (k == null) break;
                for (int i = 0; i <= k.Length - 1; i++)
                {
                    if (k.Substring(i, 1) == " ") d += 1;
                }
                if (d >= 2)
                {
                    if (k == null) break;
                    for (int i = 0; i <= k.Length - 1; i++)
                    {
                        if (k.Substring(i, 1) == " ") d += 1;
                        if (d == 2 && k.Substring(i, 1) != " ") a = a + k.Substring(i, 1);
                        if (d == 3 && k.Substring(i, 1) != " ") b = b + k.Substring(i, 1);
                        if (d == 4 && k.Substring(i, 1) != " ") c = c + k.Substring(i, 1);
                    }
                    int x = int.Parse(a) * int.Parse(a);
                    int y = int.Parse(b) * int.Parse(b);
                    int z = int.Parse(c) * int.Parse(c);
                    if (x + y == z || y + z == x || x + z == y)
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
}