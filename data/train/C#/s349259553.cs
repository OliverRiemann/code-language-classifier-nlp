using System;
class yama
{
    static void Main()
    {
        int[]a = new int[10];
        int[] b = new int[3];
        for(int i = 0; i < 10; i++)
        {
            a[i] = int.Parse(Console.ReadLine());
            for(int j = 0; j < 3; j++)
            {
                if (b[j] <= a[i])
                {
                    if (j == 0)
                    {
                        b[j +2] = b[j + 1];
                        b[j + 1] = b[j];
                        b[j] = a[i];
                        goto stop;
                    }
                    if (j == 1)
                    {
                        b[j + 1] = b[j];
                        b[j] = a[i];
                        goto stop;
                    }
                    if (j == 2)
                    {
                        b[j] = a[i];
                        goto stop;
                    }
                    
                }
                

            }
            stop:;
        }
        for(int i = 0; i < 3; i++)
        {
            Console.WriteLine(b[i]);
        }

    }
}