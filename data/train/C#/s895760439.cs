using System;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            while (true)
            {
                string a = Console.ReadLine();
                    if (a == null)
                        break;
                string[] aa = a.Split();
                int data1 = int.Parse(aa[0]);
                int data2 = int.Parse(aa[1]);

                int data0 = data1 + data2;

                int count = 1;
                while (true)
                {

                    data0 /= 10;
                    if (data0 != 0)
                        count++;
                    else
                        break;
                }
                Console.WriteLine(count);
            }
            Console.ReadLine();
            //int[] ans = { 0, 0, 0 };
            //for (int i = 0; i < 10; i++)
            //{
            //    string a = Console.ReadLine();
            //    int aa = int.Parse(a);

            //    if (ans[0] < aa)
            //    {
            //        ans[2] = ans[1];
            //        ans[1] = ans[0];
            //        ans[0] = aa;
            //    }
            //    else if (ans[1] < aa)
            //    {
            //        ans[2] = ans[1];
            //        ans[1] = aa;
            //    }
            //    else if (ans[2] < aa)
            //    {
            //        ans[2] = aa;
            //    }
            //}

            //Console.WriteLine(ans[0]);
            //Console.WriteLine(ans[1]);
            //Console.WriteLine(ans[2]);
            //Console.ReadLine();

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