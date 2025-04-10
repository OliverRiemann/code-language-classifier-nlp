module AOJ_Volume0026;

import std.stdio,std.string,std.conv,std.algorithm;

int f[10][10];

bool checkf(int x,int y)
{
	if(0 <= x && x < 10 && 0 <= y && y < 10)
	{
		return true;
	}
	else
	{
		return false;
	}
}

void dropInk(int x,int y,int size)
{
	if(size == 1)
	{
		f[x][y]++;
		if(checkf(x+1,y)) f[x+1][y]++;
		if(checkf(x-1,y)) f[x-1][y]++;
		if(checkf(x,y+1)) f[x][y+1]++;
		if(checkf(x,y-1)) f[x][y-1]++;
	}
	else if(size == 2)
	{
		foreach(i;-1..2)
		{
			foreach(j;-1..2)
			{
				if(checkf(x+i,y+j)) f[x+i][y+j]++;
			}
		}
	}
	else if(size == 3)
	{
		foreach(i;-1..2)
		{
			foreach(j;-1..2)
			{
				if(checkf(x+i,y+j)) f[x+i][y+j]++;
			}
		}
		if(checkf(x+2,y)) f[x+2][y]++;
		if(checkf(x-2,y)) f[x-2][y]++;
		if(checkf(x,y+2)) f[x][y+2]++;
		if(checkf(x,y-2)) f[x][y-2]++;
	}
}

int main()
{
	foreach(i;0..10)
	{
		foreach(j;0..10)
		{
			f[i][j] = 0;
		}
	}
	string s;
	while((s = readln.chomp).length != 0)
	{
		string[] _s = s.split(",");
		int x = _s[0].to!int;
		int y = _s[1].to!int;
		int size = _s[2].to!int;
		
		dropInk(y,x,size);
	}
	
	int count = 0;
	int ans = 0;
	foreach(i;0..10)
	{
		foreach(j;0..10)
		{
			if(f[i][j] == 0)
			{
				count++;
			}
			ans = max(ans,f[i][j]);
		}
	}
	
	writeln(count);
	writeln(ans);
	return 0;
}