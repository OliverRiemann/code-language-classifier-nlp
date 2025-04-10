using System;
using System.Collections.Generic;
using System.Linq;
   class Program
    {
        static void Main(string[] args)
        {
            List<string> I = new List<string>();
            string[] I1;
            double[] A = new double[6];
            double[] X = new double[2];
            string s;

            for (int i = 0; true; i++)
            {
                s = Console.ReadLine();
                if (string.IsNullOrEmpty(s)) break;
                I.Add(s);
            }
            for (int i = 0;i<I.Count; i++)
            {
                I1 = I[i].Split();
                for (short j = 0; j < 6; j++) {
                    A[j] = double.Parse(I1[j]);
                }
                X = Solve(A);
                Console.WriteLine(string.Format("{0:F3} {1:F3}",X[0],X[1]));
            }
        }

        public static double[] Solve(params double[] A) {
            double[] A1 = new double[6];
            double[] A2 = new double[6];
            double X, Y;
            int j;
            for (int i = 0; i < 6; i++) {
                j = i < 3 ? 4 : 1;
                A1[i] = A[i] * A[j];
                j = i < 3 ? 3 : 0;
                A2[i] = A[i] * A[j];
            }

            X = (A1[2] - A1[5]) / (A1[0] - A1[3]);
            Y = (A2[2] - A2[5]) / (A2[1] - A2[4]);
            return new double[] {X,Y};
        }
    }