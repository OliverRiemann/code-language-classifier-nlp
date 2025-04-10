import std.stdio : writeln, writefln;
import std.array;
import std.range;
import std.math : sqrt, acos, PI;

double d(double[2] a){
	return sqrt(a[0]*a[0] + a[1]*a[1]);
}

void swap(T)(ref T a, ref T b){
	T tmp = a;
	a = b;
	b = tmp;
}

void main(){
	delim = ",";
	while(hasNext){
		double[2] a = [next!double(), next!double()];
		double[2] b = [next!double(), next!double()];
		double[2] q = [next!double(), next!double()];
		
		double[2] v = a;
		v[]-=q[];
		
		double[2] r = [b[1]-a[1], -(b[0]-a[0])];
		r[]*=1.0/r.d;
		
		double cos_ = (v[0]*r[0] + v[1]*r[1])/(v.d*r.d);
		double h = v.d*cos_;
		
		r[]*=2.0*h;
		r[]+=q[];
		
		writefln("%.6f %.6f", r[0], r[1]);
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