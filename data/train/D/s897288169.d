import std.stdio : writefln;
import std.array;
import std.range;
import std.algorithm : filter;


void main(){
	while(true){
		int h = next!int();
		int m = next!int();
		int s = next!int();
		if(filter!(a => a == -1)([h, m, s]).array.length == 3){ break; }
		
		int rest = 2*60*60 - (h*60*60 + m*60 + s);
		writefln("%02d:%02d:%02d", rest/(60*60), (rest%(60*60))/60, ((rest%(60*60))%60));
		// 3倍録画から見た残り時間
		rest = 2*60*60*3 - (h*60*60 + m*60 + s)*3;
		writefln("%02d:%02d:%02d", rest/(60*60), (rest%(60*60))/60, ((rest%(60*60))%60));
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