using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace contest
{
    class Program
    {
        public class Q1
        {
            static public int func()
            {
                int MAX = 200;

                char text_split = ' ';

                for (int i = 0; i < MAX; i++)
                {
                    string read = Console.ReadLine();

                    if (read == null) break;
                    else
                    {
                        string[] words = read.Split(text_split);

                        if (words[1] == null) break;

                        int a_num = int.Parse(words[0]);
                        int b_num = int.Parse(words[1]);

                        //出力
                        int ab = a_num + b_num;
                        int count = 1;
                        while (ab >= 10)
                        {
                            ab /= 10;
                            count++;
                        }
                        Console.WriteLine("{0}", count);
                    }
                }
                return 0;
            }
        }

        public class Q2
        {
            /*
             * s it a Right Triangle?
                1 以上 1000 以下の３つの正の整数を入力し、それぞれの長さを３辺とする三角形が直角三角形である場合には
             * YES を、違う場合には NO と出力して終了するプログラムを作成して下さい。
             * 
             * input
             * 3
                4 3 5
                4 3 6
                8 8 8
             */
            static public int func()
            {

                string read = Console.ReadLine();
                int dataset_num = int.Parse(read);

                int[] num_array = new int[3];

                for (int i = 0; i < dataset_num; i++)
                {
                    //一行読み込む
                    var input_line = Console.ReadLine();

                    //空白で分割する
                    var line = input_line.Split();
                    int count = 0;
                    foreach (var num in line)
                    {
                        //数字に変換
                        num_array[count++] = int.Parse(num);
                    }
                    
                    //ソート
                    Array.Sort(num_array);

                    if (num_array[2] * num_array[2] == (num_array[0] * num_array[0] + num_array[1] * num_array[1]))
                    {
                        Console.WriteLine("YES");
                    }
                    else
                    {
                        Console.WriteLine("NO");
                    }

                }


                return 0;
            }
        }
        static int Main(string[] args)
        {
            Q2.func();

            Console.ReadKey();
            return 0;
        }

    }
}