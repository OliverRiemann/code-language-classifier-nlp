import std.stdio : write, writeln, writefln, stdin;
import std.array;
import std.range;
import std.typecons;
import std.algorithm : max, min;

void main(){
	while(true){
		int n = next!int();
		if(n==0){ break; }
		
		int[] buf = repeat(0).take(n).array;
		int max_;
		for(int y=0; y<n; ++y){
			string s = next!string();
			int[] d = repeat(0).take(n).array;
			if(s[0]=='.') d[0]=1;
			for(int x=1; x<n; ++x){
				if(s[x]=='.'){
					int min_ = 1<<28;
					min_ = min(min_, d[x-1]);
					min_ = min(min_, buf[x-1]);
					min_ = min(min_, buf[x]);
					d[x] = min_+1;
					
					max_ = max(max_, d[x]);
				}
			}
			buf = d.dup;
		}
		
		writeln = max_;
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