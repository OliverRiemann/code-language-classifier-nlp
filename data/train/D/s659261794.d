import std.stdio : write, writeln;
import std.array;
import std.range;

const int INF = 1<<28;

void swap(T)(ref T a, ref T b){
	T tmp = a;
	a = b;
	b = tmp;
}


void main(){
	while(hasNext){
		int[8] p;
		foreach(ref v; p){
			v.next;
		}
		
		int[] c = [1, 4, 1, 4, 1, 2, 1, 2];
		int[8] best;
		int min_ = INF;
		for(int i=0; i<8; ++i){
			int sum = 0;
			for(int j=0; j<8; ++j){
				int v = p[j]-c[j];
				if(v>0){
					sum += v;
				}
			}
			
			if(sum < min_){
				min_ = sum;
				best = c;
			}else if(sum == min_){
				int a, b;
				for(int j=0; j<8; ++j){
					a += a*10 + best[j];
				}
				for(int j=0; j<8; ++j){
					b += b*10 + c[j];
				}
				if(b<a){
					best = c;
				}
			}

			c ~= c.front;
			c.popFront;
		}
		for(int i=0; i<8; ++i){
			write = best[i];
			if(i+1<8){
				write = " ";
			}
		}
		write = "\n";
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