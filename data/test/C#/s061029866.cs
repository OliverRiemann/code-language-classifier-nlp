using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace ConsoleApplication2 {
    class Program {
        static void Main(string[] args) {

            TextReader input = Console.In;

            string str = "";

            // データセット取得
            int dataSet = 0;
            str = input.ReadLine();
            if (string.IsNullOrEmpty(str)) {
                return;
            }
            if (!int.TryParse(str, out dataSet)) {
                return;
            }
            if (dataSet == 0) {
                return;
            }

            for (int ii = 0; ii < dataSet; ii++) {
                str = input.ReadLine();
                if (string.IsNullOrEmpty(str)) {
                    break;
                }
                // スペースで区切る
                string[] triLens = str.Split(' ');
                // 3 個でない場合
                if (triLens.Length != 3) {
                    continue;
                }
                List<int> lens = new List<int>();
                int work = 0;
                if (!int.TryParse(triLens[0], out work)) {
                    continue;
                }
                lens.Add(work);
                if (!int.TryParse(triLens[1], out work)) {
                    continue;
                }
                lens.Add(work);
                if (!int.TryParse(triLens[2], out work)) {
                    continue;
                }
                lens.Add(work);
                lens.Sort(delegate(int w1, int w2){return w2.CompareTo(w1);});
                if (lens[0] * lens[0] == lens[1] * lens[1] + lens[2] * lens[2]) {
                    Console.WriteLine("YES");
                } else {
                    Console.WriteLine("NO");
                }
            }
        }
    }
}