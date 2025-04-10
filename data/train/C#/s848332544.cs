using System;

// ガウス・ジョルダン法
// https://www.mk-mode.com/blog/2013/09/20/cpp-simultaneous-equation-by-gauss-jorden/#

namespace Prob0004
{
    class Program
    {
        static void Main(string[] args)
        {

            const int COLUMN = 2;
            const int ROW = 3;

            string line;
            while((line = Console.ReadLine()) != null)
            {
                // a[0][0]x + a[0][1]y = a[0][2]
                // a[1][0]x + a[1][1]y = a[1][2]
                string[] tokens = line.Split(' ');
                double[,] a = new double[COLUMN, ROW];
                for(int y = 0; y < COLUMN; y++)
                {
                    for (int x = 0; x < ROW; x++)
                    {
                        a[y, x] = double.Parse(tokens[y * ROW + x]);
                    }
                }

                // pivot = (p, p)
                double coef;
                for (int p = 0; p < ROW - 1; p++)
                {

                    // ピボットのある行要素への処理
                    coef = a[p, p];
                    for (int x = p; x < ROW; x++)
                    { 
                        a[p, x] /= coef;
                    }

                    // ピボット以外の行要素への処理
                    for (int y = 0; y < COLUMN; y++)
                    {
                        if(p == y)
                        {
                            continue;
                        }

                        coef = a[y, p];
                        for (int x = p; x < ROW; x++)
                        {
                            a[y, x] -= a[p, x] * coef;
                        }
                    }
                }

                // outputs
                Console.Write("{0}", a[0, ROW - 1].ToString("F3"));
                for (int y = 1; y < COLUMN; y++)
                {
                    Console.Write(" {0}", a[y, ROW - 1].ToString("F3"));
                }
                Console.WriteLine();
            }

        }
    }
}

