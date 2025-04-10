import std.stdio : readln , chomp, writeln;
import std.string : split;
import std.conv : to;

const int MAX_N = 1000;
const int MAX_W = 1000;

int W;
int N;
int[] value;
int[] weight;

int[2] solve()
{
	// ref がなかった気をつけて
	foreach(ref i; done){ i[] = false; }
	search(0, W);
	int[2] res = [memo[0][W], note[0][W]];
	return res;
}

bool[MAX_W+1][MAX_N] done;
int[MAX_W+1][MAX_N] memo; // 価値の総量(best版)
int[MAX_W+1][MAX_N] note; // 重さの総量(同上)
int search(int i, int w)
{
	if(i==N){return 0;}
	if(done[i][w])return memo[i][w];
	int[] res = [search(i+1, w), w<weight[i] ? 0 : search(i+1, w-weight[i])+value[i]];
	int max = res[0]>=res[1] ? 0 : 1;
	int one = max==0 ? 0 : weight[i];
	done[i][w] = true;
	memo[i][w] = res[max];
	note[i][w] = i+1>=N ? one : note[i+1][w - one] + one;
	return res[max];
}

void main()
{
	io();
}

void io()
{
	int num = 0;
	while(true){
		W = readln().chomp().to!int();
		if(W==0)break;
		N = readln().chomp().to!int();
		value = new int[N];
		weight = new int[N];
		foreach(i; 0..N){
			string[] str = readln().split(",");
			value[i] = str[0].chomp.to!int();
			weight[i] = str[1].chomp.to!int();
		}
		writeln("Case ",++num,":");
		int[2] res = solve();
		writeln = res[0];
		writeln = res[1];
	}
}