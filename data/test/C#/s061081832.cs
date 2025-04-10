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

            while((str = input.ReadLine()) != null) {
                // スペースで区切る
                string[] works = str.Split(' ');
                // 6 個でない場合
                if (works.Length != 6) {
                    continue;
                }
                double a, b, c, d, e, f;
                if (!double.TryParse(works[0], out a)) {
                    continue;
                }
                if (!double.TryParse(works[1], out b)) {
                    continue;
                }
                if (!double.TryParse(works[2], out c)) {
                    continue;
                }
                if (!double.TryParse(works[3], out d)) {
                    continue;
                }
                if (!double.TryParse(works[4], out e)) {
                    continue;
                }
                if (!double.TryParse(works[5], out f)) {
                    continue;
                }
                double x = (b * f - e * c) / (b * d - e * a);
                double y = (a * f - c * d) / (a * e - b * d);
                Console.WriteLine(x.ToString("0.000") + " " + y.ToString("0.000"));
            }
        }
    }
}