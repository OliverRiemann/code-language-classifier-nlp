import std.stdio : writeln, writefln;
import std.array;
import std.range;
import std.math : fabs;

void swap(T)(ref T a, ref T b){
	T tmp = a;
	a = b;
	b = tmp;
}

void main(){
	while(true){
		int q = next!int();
		if(q==-1) break;
		
		double x = q/2.;
		while(true){
			if(fabs(x*x*x -q) < q*0.00001){
				break;
			}
			x = x - (x*x*x -q)/(3.*x*x);
		}
		writefln("%.6f", x);
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