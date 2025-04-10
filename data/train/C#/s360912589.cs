using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace contest
{
    class Program
    {
        static int Main(string[] args)
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
}