using System;
using System.IO;
using System.Linq;
using System.Collections.Generic;

public class Program
{

    public void Proc()
    {
        System.Text.StringBuilder ans = new System.Text.StringBuilder();
        while(true) {
            string inpt = Reader.ReadLine();
            if(inpt == null) {
                break;
            }
            ans.AppendLine(inpt.Split(' ').Select(a=>int.Parse(a)).Sum().ToString().Length.ToString());
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


5 7
1 99
1000 999



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