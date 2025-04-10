import std.stdio,std.string,std.conv,std.array,std.algorithm;

struct Point
{
	double x,y;

	this(double a,double b)
	{
		this.x = a;
		this.y = b;
	}

	Point opBinary(string s)(Point p) if(s == "-")
	{
		p.x = x - p.x;
		p.y = y - p.y;
		return p;
	}

	double det(Point a)
	{
		return this.x * a.y - this.y * a.x;
	}
}

Point[] convex_hull(Point[] ps)
{
	int n = cast(int)ps.length;
	int k = 0;


	sort!((a, b) 
	{
		if (a.x != b.x)  
		{
			return a.x < b.x;
		}
		else
		{
			return a.y < b.y;
		}
	})(ps);

	Point[] convex = new Point[n*2];


	foreach(i;0..n)
	{
		while (2 <= k && (convex[k-1] - convex[k-2]).det(ps[i] - convex[k-1]) <= 0 )
		{
			k--;
		}
		convex[k++] = ps[i];
	}
	
	for(int i = n-2,t = k; 0 <= i;i--)
	{
		while (t < k && (convex[k-1] - convex[k-2]).det(ps[i] - convex[k-1]) <= 0 )
		{
			k--;
		}
		convex[ k++ ] = ps[i];
	}

	convex.length = k - 1;
	return convex;
}



int main()
{
	int n;
	while((n = readln.chomp.to!int) != 0)
	{
		Point[] ps;
		ps.length = n;

		foreach(i;0..n)
		{
			string[] _s = readln.chomp.split(",");
			ps[i].x = _s[0].to!double;
			ps[i].y = _s[1].to!double;
		}

		Point[] convex = convex_hull(ps);
		writeln(n - convex.length);

	}
	return 0;
}