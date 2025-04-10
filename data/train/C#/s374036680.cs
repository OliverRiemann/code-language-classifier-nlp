using System;
using System.Collections.Generic;
using System.Linq;

class Program {
    static void Main(string[] args) {
        int n = Cin.Ni();
        for (int i = 0; i < n; i++) {
            int a = Cin.Ni();
            int b = Cin.Ni();
            int c = Cin.Ni();
            int a2 = a * a;
            int b2 = b * b;
            int c2 = c * c;


            Console.WriteLine(
                a2 + b2 == c2 ||
                b2 + c2 == a2 ||
                a2 + c2 == b2
                ? "YES" : "NO");
        }
    }
}
public class Cin {
    private static string[] s = new string[0];
    private static int i = 0;

    private static char[] cs = new char[] { ' ' };

    public static string Next() {
        if (i < s.Length) return s[i++];
        string st = Console.ReadLine();
        while (st == "") st = Console.ReadLine();
        s = st.Split(cs, StringSplitOptions.RemoveEmptyEntries);
        i = 0;
        return Next();
    }

    public static int Ni() {
        return int.Parse(Next());
    }

    public static long NextLong() {
        return long.Parse(Next());
    }

    public static double NextDouble() {
        return double.Parse(Next());
    }

}