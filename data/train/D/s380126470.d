import std.stdio : writeln, write, stdin;
import std.array;
import std.range;
import std.algorithm : max;

int n;
int s;

int[10] min_LUT;
int[10] max_LUT;


// 最悪10^{10}ぐらい
int solve(int N, int S, int mask){
	if(N==0){
		return S==0 ? 1 : 0;
	}
	if(S < min_LUT[N-1]){
		return -1;
	}
	if(max_LUT[N-1] < S){
		return -1;
	}
	
	debug{
		import std.stdio : writefln;
		dbg(N, S);
		writefln("%010b", mask);
	}
	if(S>=0){
		int count = 0;
		for(int i=9; 0<=i; --i){
			if(((mask>>i)&0x01) == 0x00){
				debug { dbg("use...", i); }
				debug { readln; }
				auto val = solve(N-1, S-i*N, mask | 0x01<<i);
				if(val==-1){
					continue;
				}
				count += val;
			}
		}
		
		return count;
	}else{
		debug{ "nowhere".dbg; }
		return -1;
	}
}


void main(){
	for(int i=0; i<10; ++i){
		min_LUT[i] = int.init;
		for(int j=i+1; 0<j; --j){
			min_LUT[i] += j*(i+1-j);
		}
	}
	debug{ min_LUT.dbg; }
	for(int i=0; i<10; ++i){
		max_LUT[i] = int.init;
		for(int j=0; j<=i; ++j){
			max_LUT[i] += (i+1-j)*(10-1-j);
		}
	}
	debug{ max_LUT.dbg; }
	
	while(hasNext()){
		n.next;
		s.next;
		
		if(1<=n && n<=10){
			auto val = solve(n, s, 0x00);
			val = max(val, 0);
			val.writeln;
		}else{
			writeln(0);
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