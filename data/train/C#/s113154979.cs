using System;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                string input = Console.ReadLine();
                if (input == null)
                    break;
                string[] split = input.Split();
                double a = double.Parse(split[0]);
                double b = double.Parse(split[1]);
                double c = double.Parse(split[2]);
                double d = double.Parse(split[3]);
                double e = double.Parse(split[4]);
                double f = double.Parse(split[5]);

                //x = (c-by)/a
                //y = (f-dx)/e
                //ey = f-dx
                //ey = f-d((c-by)/a)
                //ey = f-(dc-dby)/a
                //f-ey= (dc-dby)/a
                //fa-aey = dc-dby
                //dby-aey = dc-fa
                //y(db-ae) = dc-fa
                //y = (dc-fa)/(db-ae)

                double y = (d * c - f * a) / (d * b - a * e);
                double x = (c - b * y) / a;

                string ans = x.ToString("0.000") + " " + y.ToString("0.000");
                Console.WriteLine(ans);
            }
            Console.ReadLine();
        }
    }
}