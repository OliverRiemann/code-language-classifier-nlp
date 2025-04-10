import std.stdio : writeln, writefln;
import std.array;
import std.range;
import std.algorithm : filter;
import std.math : sqrt;


void main(){
	double[2][1000+1] LUT;
	LUT[2][0] = 1.00;
	LUT[2][1] = 1.00;
	for(int i=3; i<=1000; ++i){
		double x = LUT[i-1][0];
		double y = LUT[i-1][1];
		double[2] v = [-y, x];				// 直行するベクトル
		double r = 1.0/sqrt(v[0]*v[0] + v[1]*v[1]);	// 単位ベクトル用の係数
		
		LUT[i][0] = r*v[0] + x;
		LUT[i][1] = r*v[1] + y;
	}
	debug(1){
	for(int i=2; i<=6; ++i){
		writefln("%f, %f", LUT[i][0], LUT[i][1]);
	}
	}
	
	while(true){
		int n = next!int();
		if(n==-1){ break; }
		
		writefln("%.2f", LUT[n][0]);
		writefln("%.2f", LUT[n][1]);
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