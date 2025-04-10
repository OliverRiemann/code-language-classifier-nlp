using System;
using System.Collections.Generic;
using System.Linq;

class Program {
    static void Main(string[] args) {

        int[] monts = new int[10];
        for (int i = 0; i < 10; i++) {
            monts[i] = Cin.Ni();
        }
        Array.Sort(monts);
        Array.Reverse(monts);
        for (int i = 0; i < 3; i++) {
            Console.WriteLine(monts[i]);
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