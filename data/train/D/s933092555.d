import std.stdio : writeln, write, stdin;
import std.array;
import std.range;
import std.algorithm : filter, min;

int INF = 1<<28;

int solve(int[][] map, int n){
	int ptr = 0;
	bool[] done = new bool[n];
	int[] last = new int[n];
	int[] list = repeat(INF).take(n).array;
	list[ptr] = 0;
	while(true){
		int min_ = INF;
		for(int i=0; i<n; ++i){
			if(!done[i]){
				if(list[i] < min_){
					min_ = list[i];
					ptr = i;
				}
			}
		}
		if(min_==INF){ break; }
		
		done[ptr] = true;
		for(int i=0; i<n; ++i){
			if(!done[i]){
				if(map[ptr][i] < INF){
					if(map[ptr][i] < list[i]){
						list[i] = map[ptr][i];
					}
				}
			}
		}
	}
	assert(filter!(a => a==INF)(list).array.length==0);
	
	int count = 0;
	foreach(ite; filter!(a => a!=0)(list).array){
		count += ite -1;
	}
	
	return count;
}

void main(){
	while(true){
		delim = "\n";
		int n = next!int();
		
		if(n==0){ break; }
		
		int m = next!int();

		int[][] map;
		foreach(i; n.iota){
			map ~= repeat(INF).take(n).array;
		}
		delim = ",";
		for(int i=0; i<m; ++i){
			int a = next!int();
			int b = next!int();
			int d = next!int()/100;
			
			map[a][b] = d;
			map[b][a] = d;
		}
		
		solve(map, n).writeln;
	}
}


import std.stdio : readln, chomp;
import std.conv : to;
import std.string : split;
shared string[] input;
shared string delim = " ";
T next(T)()
in
{
	assert(hasNext());
}
out
{
	input.popFront;
}
body
{
	return input.front.to!T;
}

void next(T)(ref T v){
	v = next!T();
}

bool hasNext(){
	if(input.length > 0){
		return true;
	}
	
	string str = readln;
	if(str.length > 0){
		input ~= str.chomp.split(delim);
		return true;
	}else{
		return false;
	}
}


void dbg(T...)(T vs)
{
	import std.stdio : stderr;
	foreach(v; vs)
		stderr.write(v.to!string ~ " ");
	stderr.write("\n");
}

T clone(T)(T v){
	T v_;
	static if(isInputRange!(T)){
		foreach(ite; v){
			v_ ~= ite.clone;
		}
	}else{
		v_ = v;
	}
	
	return v_;
}