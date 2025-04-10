using System;
using System.Collections.Generic;

namespace AOJ.Volume0
{
    class Program0004
    {
        static void Main(string[] args)
        {
            const int N = 6;
            string input;
            Queue<double[]> queue = new Queue<double[]>();

            while ((input = Console.ReadLine()) != null)
            {
                string[] splitedInput = input.Split(' ');
                double[,] param = new double[2,3];

                for (int i = 0; i < 2; i++)
                {
                    for (int j = 0; j < 3; j++)
                    {
                        param[i, j] = double.Parse(splitedInput[i * 3 + j]);
                    }
                }

                queue.Enqueue(SolveEquation(param));
            }

            foreach (var ans in queue)
            {
                Console.WriteLine("{0:#####0.000} {1:#####0.000}", ans[0], ans[1]);
            }
        }

        static double[] SolveEquation(double[,] parameters)
        {
            double x, y;
            double a = parameters[1, 0] / parameters[0, 0];

            for (int i = 0; i < 3; i++)
            {
                parameters[1, i] -= parameters[0, i] * a;
            }

            y = parameters[1, 2] / parameters[1, 1];
            x = (parameters[0, 2] - parameters[0, 1] * y) / parameters[0, 0];

            return new[] { x, y };
        }
    }
}