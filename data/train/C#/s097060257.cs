using System;
using System.Collections.Generic;
using System.Text;

namespace contest
{
    class Program
    {       
        static int Main(string[] args)
        {
                string read = Console.ReadLine();
                int dataset_num = int.Parse(read);

                for (int i = 0; i < dataset_num; i++)
                {
                    //空白で分割する
                    var line = Console.ReadLine().Split();

                    //配列の要素、すべてに処理を行う
                    var num_array =  Array.ConvertAll(line, len => int.Parse(len));

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