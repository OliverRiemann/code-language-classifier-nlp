using System;
using System.Linq;

class Program
{
    public static void Main(string[] args)
    {
        int sum = 0;
        while(true)
        {
            string s = Console.ReadLine();
            if(s == null) break;
            string[] ss = s.Split();
            int a = int.Parse(ss[0]);
            int b = int.Parse(ss[1]);
            sum = a + b;
            
            if(sum / 1000000 >= 1)
            {
                Console.WriteLine(7);
            }else if(sum / 100000 >= 1)
            {
                Console.WriteLine(6);
            }else if(sum / 10000 >= 1)
            {
                Console.WriteLine(5);
            }else if(sum / 1000 >= 1)
            {
                Console.WriteLine(4);
            }else if(sum/ 100 >= 1)
            {
                Console.WriteLine(3);
            }else if(sum / 10 >= 1)
            {
                Console.WriteLine(2);
            }else
            {
                Console.WriteLine(1);
            }
        }
    }
}
