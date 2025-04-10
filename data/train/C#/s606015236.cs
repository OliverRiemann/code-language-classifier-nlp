using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Text;
using System.Text.RegularExpressions;
using System.Linq;
using System.IO;

class Program
{
    static private Magatro M = new Magatro();
    static private void Main(string[]args)
    {
        M.Scan();
        M.Solve();
    }
}

public class Scanner
{
    private string[] S;
    private int Index;
    private char Separator;

    public Scanner(char separator = ' ')
    {
        Index = 0;
        Separator = separator;
        S = new string[0];
    }

    private string[] Line()
    {
        return Console.ReadLine().Split(Separator);
    }

    public string Next()
    {
        string result;
        if (Index >= S.Length)
        {
            S = Line();
            Index = 0;
        }
        result = S[Index];
        Index++;
        return result;
    }
    public int NextInt()
    {
        return int.Parse(Next());
    }
    public double NextDouble()
    {
        return double.Parse(Next());
    }
    public long NextLong()
    {
        return long.Parse(Next());
    }
}

public class Magatro
{

    public void Scan()
    {
    }

    public void Solve()
    {
        for (int i = 1; i <= 9; i++)
        {
            for (int j = 1; j <= 9; j++)
            {
                Console.WriteLine(Anser(i, j));
            }
        }
    }

    private string Anser(int i,int j)
    {
        return string.Format("{0}x{1}={2}", i,j,i*j);
    }

}