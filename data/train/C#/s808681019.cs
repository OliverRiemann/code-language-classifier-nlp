using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

using Pair = System.Collections.Generic.KeyValuePair<int, int>;

class Program
{
	public Program() { }

	static void Main(string[] args)
	{
		new Program().prog();
	}
	//Scanner cin;
	const int MOD = 1000000007;
	const int INF = int.MaxValue;
	const double EPS = 1e-7;
	
	void prog()
	{
		//cin = new Scanner();

		for (int i = 0; i < 9; i++)
		{
			for (int j = 0; j < 9; j++)
			{
				Console.WriteLine("{0}x{1}={2}",i+1,j+1,(i+1)*(j+1));
			}
		}
	}
}

class Scanner
{
	string[] s;
	int i;

	char[] cs = new char[] { ' ' };

	public Scanner()
	{
		s = new string[0];
		i = 0;
	}

	public string next()
	{
		if (i < s.Length) return s[i++];
		string st = Console.ReadLine();
		while (st == "") st = Console.ReadLine();
		s = st.Split(cs, StringSplitOptions.RemoveEmptyEntries);
		i = 0;
		return next();
	}

	public int nextInt()
	{
		return int.Parse(next());
	}

	public long nextLong()
	{
		return long.Parse(next());
	}

	public double nextDouble()
	{
		return double.Parse(next());
	}
}