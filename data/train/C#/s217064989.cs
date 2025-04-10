using System;
using System.Text;
using System.Linq;
using System.Collections.Generic;


public class my
{
	
	private static StringBuilder sb = new StringBuilder();
	
	public static void Main()
	{
		var n = my.GetInt();
		
		for(int i = 0; i < n; i++) {
			var A = my.GetIntArray();
			
			Array.Sort(A);
			
			sb.AppendLine( (A[0]*A[0] + A[1]* A[1]== A[2]*A[2])? "YES" : "NO");
		}
		
		my.Flush();
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