using System;

namespace AOJ.Volume0
{
    public class SimultaneousEquation
    {
        public static void Main()
        {
            while (true)
            {
                string input = Console.ReadLine();
                if (string.IsNullOrEmpty(input)) { break; }
                var data = input.Split(' ');

                double a, b, c, d, e, f;
                a = double.Parse(data[0]);
                b = double.Parse(data[1]);
                c = double.Parse(data[2]);
                d = double.Parse(data[3]);
                e = double.Parse(data[4]);
                f = double.Parse(data[5]);
                // クラメールの公式で解を求める
                // 解がないケースは問題に記述がないので考慮しない
                double v1 = (a * e) - (b * d);
                double x = ((c * e) - (b * f)) / v1;
                double y = ((a * f) - (c * d)) / v1;
                // 四捨五入
                x += 0.0005d;
                y += 0.0005d;
                x = Math.Floor(x * 1000) / 1000;
                y = Math.Floor(y * 1000) / 1000;

                Console.WriteLine(string.Format("{0:f3} {1:f3}", x, y));
            }
        }
    }
}