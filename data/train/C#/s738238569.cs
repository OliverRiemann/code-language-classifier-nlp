using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _0003
{
    class Program
    {
        static void Main(string[] args)
        {
            // 1行目：データセットの数n
            // 2～n+1行目：三角形の3辺を示す整数がスペース区切りで3つ与えられる
            // それぞれを3辺とする三角形が直角三角形ならYES,そうでなければNOと出力するプログラム

            // 辺a ≤ 辺b ≤ 辺c の時、a^2 + b^2 = c^2 ならば三角形は直角三角形となる。

            int n = int.Parse(Console.ReadLine());

            for (int i = 0; i < n; i++)          
            {
                int[] ary = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
                Array.Sort(ary);                                                            // 読み込んだ配列を昇順に並び替え

                if (Math.Pow(ary[0], 2) + Math.Pow(ary[1], 2) == Math.Pow(ary[2], 2))
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

