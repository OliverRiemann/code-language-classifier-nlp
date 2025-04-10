import std.stdio : write, writeln, writefln, stdin;
import std.array;
import std.range;
import std.typecons;
import std.algorithm : max;
import std.math;

alias Tuple!(real, real) P;

void main(){
	delim = ",";
	
	while(true){
		int n = next!int();
		if(n==0){ break; }
		
		P[] p = new P[n];
		foreach(i; n.iota){
			p[i][0] = next!real();
			p[i][1] = next!real();
		}
		
		P[] cross;
		foreach(i; n.iota){
			foreach(j; iota(i+1, n)){
				if(i!=j){
					P a = p[i];
					P b = p[j];
					
					real[2] v = [b[0]-a[0], b[1]-a[1]];
					real[] res_x, res_y;
					if(-real.epsilon <= v[1] && v[1] <= real.epsilon){
						res_y = f_y([], v);
						res_x = f_x(res_y, v);
					}else{
						res_x = f_x([], v);
						res_y = f_y(res_x, v);
					}
					
					foreach(k; res_x.length.iota){
						P p_;
						p_[0] = a[0] + res_x[k];
						p_[1] = a[1] + res_y[k];
						
						cross ~= p_;
					}
				}
			}
		}
		debug(1) { cross.dbg; }
		
		int max_;
		foreach(i; cross){
			int cnt;
			foreach(j; p){
				if([j[0]-i[0], j[1]-i[1]].d <= 1. + double.epsilon){
					++cnt;
				}
			}
			max_ = max(max_, cnt);
		}
		max_ = max(max_, 1);
		
		writeln = max_;
	}
}

real d(real[2] p){
	return sqrt(p[0]*p[0] + p[1]*p[1]);
}

real[] f_x(real[] y, real[2] p){
	if(-real.epsilon <= p[1] && p[1] <= real.epsilon){
		real[] res_x;
		
		foreach(ite; y){
			res_x ~= (p[0]*p[0] -2.*p[1]*ite + p[1]*p[1])/(2.*p[0]);
		}
		
		return res_x;
	}else{
		real a = 1. + (p[0]*p[0])/(p[1]*p[1]);
		real b = -(p[0]/p[1])*(p[0]*p[0] + p[1]*p[1])/(p[1]);
		real c = (p[0]*p[0] + p[1]*p[1])/(2.*p[1]);	c=c*c -1.;
		
		real D = b*b - 4.*a*c;
		if(D < -real.epsilon){
			return [];
		}else if(-real.epsilon <= D && D <= real.epsilon){
			return [(-b)/(2.*a)];
		}else{
			debug(1){ dbg("get...", a, b, c, [(-b + sqrt(D))/(2.*a), (-b - sqrt(D))/(2.*a)]); }
			return [(-b + sqrt(D))/(2.*a), (-b - sqrt(D))/(2.*a)];
		}
	}
}

real[] f_y(real[] x, real[2] p){
	if(-real.epsilon <= p[1] && p[1] <= real.epsilon){
		real a = 1. + (p[1]*p[1])/(p[0]*p[0]);
		real b = -(p[1]/p[0])*(p[0]*p[0] + p[1]*p[1])/(p[0]);
		real c = (p[0]*p[0] + p[1]*p[1])/(2.*p[0]);	c=c*c -1.;
		
		real D = b*b - 4.*a*c;
		if(D < -real.epsilon){
			return [];
		}else if(-real.epsilon <= D && D <= real.epsilon){
			return [(-b)/(2.*a)];
		}else{
			return [(-b + sqrt(D))/(2.*a), (-b - sqrt(D))/(2.*a)];
		}
	}else{
		real[] res_y;
		
		foreach(i; x){
			debug(1){ dbg(i.stringof, i); }
			res_y ~= (p[0]*p[0] -2.*p[0]*i + p[1]*p[1])/(2.*p[1]);
		}
	
		return res_y;
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