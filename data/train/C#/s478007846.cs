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
            int MAX = 200;

            char text_split = ' ';

            for (int i = 0; i < MAX; i++)
            {
                string read = Console.ReadLine();

                if (read == null) break;
                else
                {
                    string[] words = read.Split(text_split);

                    if( words[1] == null) break;
                    
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

            //Console.ReadKey();
            return 0;
        }

    }
}