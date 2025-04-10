using System;
using System.Collections.Generic;

class Program {
    static int Main(string[] args) {
        List<decimal[]> list = new List<decimal[]>();

        while (true) {
            string v = Console.ReadLine();
            if (string.IsNullOrEmpty(v) == true) { break; }

            string[] vs = v.Split(' ');
            decimal[] vd = new decimal[6];

            for (int i = 0; i < 6; i++) {
                vd[i] = decimal.Parse(vs[i]);
            }
            list.Add(vd);
        }

        for (int i = 0; i < list.Count; i++) {
            Calc(list[i]);
        }

        return 0;
    }

    static void Calc(decimal[] v) {
        decimal a = v[0];
        decimal b = v[1];
        decimal c = v[2];
        decimal d = v[3];
        decimal e = v[4];
        decimal f = v[5];

        decimal x = Math.Round((b * f - c * e) / (b * d - a * e), 3, MidpointRounding.AwayFromZero);
        decimal y = Math.Round((a * f - c * d) / (a * e - b * d), 3, MidpointRounding.AwayFromZero);

        Console.WriteLine(string.Format("{0:f3} {1:f3}", x, y));
    }
}