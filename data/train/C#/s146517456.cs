using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

public class Program
{

    public void Proc()
    {
        System.Text.StringBuilder ans = new System.Text.StringBuilder();
        int inputCount = int.Parse(Reader.ReadLine());
        for (int i = 0; i < inputCount; i++) {
            if(IsRightTriangle(Reader.ReadLine().Split(' ').Select(a=>int.Parse(a)).ToArray())) {
                ans.AppendLine("YES");
            } else {
                ans.AppendLine("NO");
            }
        }
        Console.Write(ans.ToString());
        
    }

    private bool IsRightTriangle(int[] len) {
        return IsRightTriangleSub(len[0], len[1], len[2]) || IsRightTriangleSub(len[0], len[2], len[1]) || IsRightTriangleSub(len[1], len[2], len[0]);
    }

    private bool IsRightTriangleSub(int num1, int num2, int num3) {
        if(num1*num1+num2*num2==num3*num3) {
            return true;
        }
        return false;
    }

    public class Reader
	{
		private static StringReader sr;
		public static bool IsDebug = false;
		public static string ReadLine()
		{
			if (IsDebug)
			{
				if (sr == null)
				{
					sr = new StringReader(InputText.Trim());
				}
				return sr.ReadLine();
			}
			else
			{
				return Console.ReadLine();
			}
		}
		private static string InputText = @"


3
4 3 5
4 3 6
8 8 8


";
	}

	public static void Main(string[] args)
	{
#if DEBUG
		Reader.IsDebug = true;
#endif
		Program prg = new Program();
		prg.Proc();
	}
}