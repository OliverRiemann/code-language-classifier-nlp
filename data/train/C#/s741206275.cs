using System;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] ans = { 0, 0, 0 };
            for (int i = 0; i < 10; i++)
            {
                string a = Console.ReadLine();
                int aa = int.Parse(a);

                if (ans[0] < aa)
                {
                    ans[2] = ans[1];
                    ans[1] = ans[0];
                    ans[0] = aa;
                }
                else if (ans[1] < aa)
                {
                    ans[2] = ans[1];
                    ans[1] = aa;
                }
                else if (ans[2] < aa)
                {
                    ans[2] = aa;
                }
            }

            Console.WriteLine(ans[0]);
            Console.WriteLine(ans[1]);
            Console.WriteLine(ans[2]);
            Console.ReadLine();

            //    for (int i = 1; i <= 9; i++)
            //    {
            //        for (int ii = 1; ii <= 9; ii++)
            //        {
            //            string ans;
            //            ans = i+"x"+ii+"="+i*ii;
            //            Console.WriteLine(ans);

            //        }

            //    }
            //            Console.ReadLine();        }
        }
    }
}