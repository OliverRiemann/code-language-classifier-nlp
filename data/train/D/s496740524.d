import std.stdio : write, writef;
import std.array;
import std.range;

void main(){
	while(true){
		int n = next!int();
		if(n==0){ return; }
		
		int[][] map;
		for(int i=0; i<n; ++i){ map ~= repeat(0).take(n).array; }
		int count;
		
		int[2] ptr = [n/2, n/2+1];
		while(count<n*n){
			while(map[ptr[1]][ptr[0]]!=0){
				ptr[0] = (ptr[0] + n-1)%n;
				++ptr[1] %= n;
			}
			
			map[ptr[1]][ptr[0]] = ++count;

			++ptr[0] %= n;
			++ptr[1] %= n;
		}
		
		for(int y=0; y<n; ++y){
			for(int x=0; x<n; ++x){
				writef("%4d",map[y][x]);
			}
			"\n".write;
		}
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