using System;
using System.Collections;
using System.Linq;

namespace Simultaneous_Equation
{
    class Program
    {
        static void Main(string[] args)
        {
            ArrayList[] result = new ArrayList[2];
            result[0] = new ArrayList();
            result[1] = new ArrayList();

            while (true)
            {
                var input = Console.ReadLine();

                if (string.IsNullOrEmpty(input)) break;

                var strcoe = input.Split(' ');
                if (strcoe.Length != 6) continue;

                double[] coe = new double[6];
                for(var i = 0; i < coe.Length; i++)
                {
                    coe[i] = double.Parse((strcoe[i]));
                }

                ArrayList[] matrix1 = new ArrayList[2];
                for(int i = 0; i < 2; i++)
                {
                    matrix1[i] = new ArrayList();
                    for (int j = 0; j < 2; j++)
                    {
                        matrix1[i].Add(coe[i * 3 + j]);
                    }
                }

                ArrayList[] matrix2 = new ArrayList[2];
                for (int i = 0; i < 2; i++)
                {
                    matrix2[i] = new ArrayList();
                    matrix2[i].Add(coe[i * 3 + 2]);
                }

                Matrix mt = new Matrix();
                ArrayList[] inv = mt.Inverse_2_2(matrix1);
                if(inv == null) { continue; }

                ArrayList[] xy = mt.Product(inv, matrix2);
                result[0].Add(xy[0][0]);
                result[1].Add(xy[1][0]);
            }

            for(int i = 0; i < result[0].Count; i++)
            {
                Console.WriteLine("{0:f3} {1:f3}", result[0][i], result[1][i]);
            }
        }
    }

    class Matrix
    {
        public ArrayList[] Inverse_2_2(ArrayList[] matrix)
        {
            ArrayList[] inv = new ArrayList[2];
            for (int i = 0; i < 2; i++)
            {
                inv[i] = new ArrayList();
                for (int j = 0; j < 2; j++)
                {
                    inv[i].Add(.0);
                }
            }
            
            var det = (double)matrix[0][0] * (double)matrix[1][1] - (double)matrix[0][1] * (double)matrix[1][0];
            if(det == 0) { return null; }

            inv[0][0] = (double)matrix[1][1] / (double)det;
            inv[1][1] = (double)matrix[0][0] / (double)det;
            inv[0][1] = (double)matrix[0][1] / (double)-det;
            inv[1][0] = (double)matrix[1][0] / (double)-det;

            return inv;
        }

        public ArrayList[] Product(ArrayList[] matrix1, ArrayList[] matrix2)
        {
            var row1 = matrix1.Count();
            var col1 = matrix1[0].Count;
            var col2 = matrix2[0].Count;

            ArrayList[] result = new ArrayList[2];
            for (int i = 0; i < row1; i++)
            {
                result[i] = new ArrayList();
                for (int j = 0; j < col2; j++)
                {
                    result[i].Add(.0);
                }
            }

            for(int i = 0; i < row1; i++)
            {
                for(int j = 0; j < col2; j++)
                {
                    double val = 0;
                    for(int k = 0; k < col1; k++) {
                        val += (double)matrix1[i][k] * (double)matrix2[k][j];
                    }
                    result[i][j] = val;
                }
            }
            
            return result;
        }
    }
}