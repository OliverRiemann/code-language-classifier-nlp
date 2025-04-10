using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

public class Program
{

    public void Proc()
    {
        int[] list = new int[10];
        for (int i = 0; i < 10; i++) {
            list[i] = int.Parse(Reader.ReadLine());
        }
        list = list.OrderByDescending(a => a).ToArray();
        System.Text.StringBuilder ans = new System.Text.StringBuilder();
        for (int i = 0; i < 3; i++) {
            ans.AppendLine(list[i].ToString());
        }
        Console.Write(ans.ToString());

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

1819
2003
876
2840
1723
1673
3776
2848
1592
922



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