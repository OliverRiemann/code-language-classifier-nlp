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
            decimal[] ret = GetAns(inpt.Split(' ').Select(a => decimal.Parse(a)).ToArray());
            ans.AppendLine(ret[0] + " " + ret[1]);
        }
        Console.Write(ans.ToString());
        
    }

    private decimal[] GetAns(decimal[] inpt) {
        decimal[] ret = new decimal[2];
        decimal x = GetX(inpt, -5000, 5000);
        decimal y = GetY(inpt, x);

        ret[0] = Math.Round(x, 3, MidpointRounding.AwayFromZero);
        ret[1] = Math.Round(y, 3, MidpointRounding.AwayFromZero);
        return ret;
    }

    private decimal GetX(decimal[] list, decimal min, decimal max) {
        if(max - min < 0.0000001m) {
            return Math.Round(min, 6, MidpointRounding.ToEven);
        }

        decimal md1 = min + (max - min) / 3;
        decimal md2 = min + (max - min) / 3 * 2;

        decimal[] vals = new decimal[4];
        vals[0] = GetYDiff(list, min);
        vals[1] = GetYDiff(list, md1);
        vals[2] = GetYDiff(list, md2);
        vals[3] = GetYDiff(list, max);

        decimal valMin = vals.Min();
        if(valMin == vals[0]) {
            return GetX(list, min, md1);
        } else if(valMin == vals[1]) {
            return GetX(list, min, md2);
        } else if(valMin == vals[2]) {
            return GetX(list, md1, max);
        } else {
            return GetX(list, md2, max);
        }
    }

    private decimal GetY(decimal[] list, decimal x) {
		decimal y = (list[2] - x * list[0]) / list[1];
        return y;
	}

    private decimal GetYDiff(decimal[] list, decimal x) {
        decimal y = GetY(list, x);
        decimal tmp = Math.Abs((x * list[3] + y * list[4]) - list[5]);
        return tmp;
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


1 2 3 4 5 6
2 -1 -2 -1 -1 -5



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