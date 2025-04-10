using System;
using System.Text;

namespace Simultaneous_Equation
{
    class Program
    {
        static void Main(string[] args)
        {
            var sb = new StringBuilder();
            try
            {
                
                while (true)
                {
                    double[] input = Array.ConvertAll(Console.ReadLine().Split(' '), double.Parse);


                    input[1] = input[1] / input[0];
                    input[2] = input[2] / input[0];

                    input[4] = input[4] - input[3] * input[1];
                    input[5] = input[5] - input[3] * input[2];

                    input[5] = input[5] / input[4];
                    input[2] = input[2] - input[5] * input[1];
                    sb.AppendLine(string.Format("{0:f3} {1:f3}", input[2], input[5]));
                }
                
                
                
            }
            catch
            {
                sb.Remove(sb.Length - 1, 1);
                Console.WriteLine(sb);
                Console.ReadLine();
            }
        }
    }
}

