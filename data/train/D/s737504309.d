import std.stdio : writeln, writefln;
import std.array;
import std.range;
import std.math : sqrt, acos, PI;

const int INF = 1<<28;

double d(double[2] a){
	return sqrt(a[0]*a[0] + a[1]*a[1]);
}

double ep(double[2] a, double[2] b){
	return a[0]*b[1] - a[1]*b[0];
}

double g(double[2] a, double[2] b){
	double cos_ = (a[0]*b[0] + a[1]*b[1])/(a.d*b.d);
	double theta = acos(cos_);
	if(ep(a, b)>0){
		theta+=PI;
	}
	
	return theta;
}

void swap(T)(ref T a, ref T b){
	T tmp = a;
	a = b;
	b = tmp;
}

void main(){
	double[2][] list;
	
	
	delim = ",";
	double min_ = INF;
	while(hasNext){
		double[2] v_ = [next!double(), next!double()];
		if(v_[0] < min_){
			list = [v_] ~ list;
			min_ = v_[0];
		}else{
			list = list ~ [v_];
		}
	}
	
	int[] sorted;
	sorted ~= 0;
	
	auto n = list.length;
	double[2] v = [0.,1.];
	double[2] node = list[0];
	while(true){
		min_ = INF;
		int min_idx;
		for(int i=0; i<n; ++i){
			double[2] v_ = list[i];
			v_[] -= node[];
			double theta = g(v, v_);
			
			if(theta<min_){
				min_ = theta;
				min_idx = i;
			}
		}
		
		if(min_idx==0) break;
		
		sorted ~= min_idx;
		
		double[2] v_ = list[min_idx];
		v_[] -= node[];
		
		node = list[min_idx];
		v = v_;
	}
	
	double S=0.;
	for(int i=1; i<sorted.length-1; ++i){
		double[2] a = list[sorted[i]];
		double[2] b = list[sorted[i+1]];
		
		a[]-=list[sorted[0]][];
		b[]-=list[sorted[0]][];
		
		double value = ep(a, b);
		value = sqrt(value*value)/2.;
		
		S += value;
	}
	
	writefln("%.6f", S);
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