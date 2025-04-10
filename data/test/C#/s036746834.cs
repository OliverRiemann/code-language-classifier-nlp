using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    //Constで定義すると警告が出るので、変数として定義
    static string InputPattern = "Input2";

    static List<string> GetInputList()
    {
        var WillReturn = new List<string>();

        if (InputPattern == "Input1") {
            WillReturn.Add("1819");
            WillReturn.Add("2003");
            WillReturn.Add("876");
            WillReturn.Add("2840");
            WillReturn.Add("1723");
            WillReturn.Add("1673");
            WillReturn.Add("3776");
            WillReturn.Add("2848");
            WillReturn.Add("1592");
            WillReturn.Add("922");
        }
        else {
            for (int I = 1; I <= 10; I++) {
                WillReturn.Add(Console.ReadLine());
            }
        }
        return WillReturn;
    }

    static void Main()
    {
        List<string> InputList = GetInputList();

        IEnumerable<int> tmp1 = InputList.Select(X => int.Parse(X));
        IEnumerable<int> tmp2 = tmp1.OrderByDescending(X => X).Take(3);

        foreach (int EachInt in tmp2) {
            Console.WriteLine(EachInt);
        }
    }
}