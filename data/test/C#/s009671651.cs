using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Prob0004
{
    class Program
    {
        const char splitBy = ' ';

        static void Main(string[] args)
        {
            string line;
            while (!string.IsNullOrEmpty(line = System.Console.ReadLine()))
            {
                double[] param = Array.ConvertAll(line.Split(splitBy), e => double.Parse(e));
                solve(param);
            }
        }

        static void solve(double[] param)
        {
            double x;
            double y;

            if (param[0] != 0.0 && param[3] != 0.0)
            {
                double a = param[3] / param[0];
                y = (param[5] - param[2] * a) / (param[4] - param[1] * a);
                x = (param[2] - param[1] * y) / param[0];
            }
            else
            {
                double a = param[4] / param[1];
                x = (param[5] - param[2] * a) / (param[3] - param[0] * a);
                y = (param[2] - param[0] * x) / param[1];
            }

            Console.WriteLine("{0:F3} {1:F3}", x, y);


        }


    }
}