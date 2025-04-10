using System;

namespace TestSpace
{
    class Test
    {
        static void Main(string[] args)
        {
            string[] arrRead;
            int i, j, k, l, N, z;
            N = int.Parse(Console.ReadLine());
            int[] intRead = new int[3];

            for (i = 0; i < N; i++)
            {
                arrRead = Console.ReadLine().Split(' ');

                for (j = 0; j < 3; j++)
                {
                    intRead[j] = int.Parse(arrRead[j]);
                }

                for (k = 0; k < 2; k++)
                {
                    for (l = 2; k < l; l--)
                    {
                        if (intRead[l] < intRead[l - 1])
                        {
                            z = intRead[l];
                            intRead[l] = intRead[l - 1];
                            intRead[l - 1] = z;
                        }                        
                    }
                }

                if (Math.Pow(intRead[0], 2) + Math.Pow(intRead[1], 2) == Math.Pow(intRead[2], 2))
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

