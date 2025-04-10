using System;
using System.Text;
using System.Linq;
using System.Collections.Generic;


public class my
{
	
	private static StringBuilder sb = new StringBuilder();
	
	public static void Main()
	{
		for(int i = 1; i <= 9; i++) {
			for(int j = 1; j <= 9; j++) {
				sb.AppendLine(string.Format("{0}x{1}={2}", i, j, i*j ));
			}
		}
		
		Console.Write(sb);
	}
	
	private static int CountChar(string s, char c)
	{
		return s.Length - s.Replace(c.ToString(), "").Length;
	}
	
	private static void Flush()
	{
		Console.Write(sb);
		sb.Length = 0;
	}
	
	private static void AppendLine(int v)
	{
		sb.AppendLine(v.ToString());
	}
	
	private static void AppendLine(long v)
	{
		sb.AppendLine(v.ToString());
	}
	
	private static void AppendLine(string[] v)
	{
		sb.AppendLine(string.Join(" ", v));
	}

	private static void Swap(ref string a, ref string b) 
	{
		string tmp = a;
		a = b;
		b = tmp;
	}
	
	private static void Swap(ref int a, ref int b) 
	{
		int tmp = a;
		a = b;
		b = tmp;
	}
	
	private static int[] GetIntArray()
	{
		return Array.ConvertAll(Console.ReadLine().Split(' '), int.Parse);
	}
	
	private static void WriteArray(int[] a)
	{
		Console.WriteLine(string.Join(" ", Array.ConvertAll( a, x=>x.ToString() ) ) );
	}
	
	private static void WriteArray(long[] a)
	{
		Console.WriteLine(string.Join(" ", Array.ConvertAll( a, x=>x.ToString() ) ) );
	}
	
	private static int GetInt()
	{
		return int.Parse(Console.ReadLine());
	}
	
	private static long GetLong()
	{
		return long.Parse(Console.ReadLine());
	}
}