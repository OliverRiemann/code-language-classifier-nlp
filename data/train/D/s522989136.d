
import std.stdio,std.string,std.conv,std.algorithm;

int ans[10];

void solve(int a[10],int n)
{
	int count = 0;
	foreach(i;0..a.length) count += a[i];

	if(count == 0)
	{
		ans[n] = 1;
		return;
	}

	foreach(i;1..10)
	{
		if(a[i] >= 3)
		{
			a[i] -= 3;
			solve(a,n);
			a[i] += 3;
		}
	}

	foreach(i;3..10)
	{
		if(a[i-2] && a[i-1] && a[i])
		{
			a[i-2]--; a[i-1]--; a[i]--;
			solve(a,n);
			a[i-2]++; a[i-1]++; a[i]++;
		}
	}
}

int main()
{
	string s;
	while((s = readln.chomp).length != 0)
	{
		foreach(i;0..10)
		{
			ans[i] = 0;
		}

		int a[10];
		foreach(i;0..s.length) a[s[i] - '0']++;

		foreach(i;1..10)
		{
			if(a[i] == 4)
			{
				continue;
			}
			else
			{
				a[i]++;
				foreach(j;1..10)
				{
					if(a[j] >= 2)
					{
						a[j] -= 2;
						solve(a,i);
						a[j] += 2;
					}
				}
				a[i]--;
			}
		}
		bool count_0 = true;
		int ans_max = 0;
		foreach(i;0..10)
		{
			if(ans[i])
			{
				if(ans[i])
				{
					count_0 = false;
					ans_max = max(ans_max,i);
				}
			}
		}

		if(count_0)
		{
			0.writeln;
		}
		else
		{
			bool flag = true;
			foreach(i;1..10)
			{
				if(ans[i] == 1)
				{
					if(i == ans_max)
					{
						i.writeln;
					}
					else
					{
						write(i," ");
					}
				}
			}
		}
	}
	return 0;
}