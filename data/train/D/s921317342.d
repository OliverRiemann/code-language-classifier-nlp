import std.stdio : write, writeln;
import std.array;
import std.range;
import std.algorithm : filter;

int bs(int[] arr, int trg){
	int l = 0;
	int r = cast(int)(arr.length-1);
	
	while(true){
		int idx = (l+r)/2;
		
		if(trg<arr[idx]){
			r = idx-1;
		}else if(arr[idx]<trg){
			l = idx+1;
		}else{
			return idx;
		}
		
		if(r<l){ return -1; }
	}
}

void main(){
	while(true){
		int n = next!int();
		int m = next!int();
		
		if((n | m) == 0x00){
			return;
		}
		
		bool[int] set;
		foreach(i; n.iota){
			set[i] = true;
		}
		
		int buf=0;
		int trg=m-1;
		while(set.length>1){
			int[] d = set.keys;
			int idx = bs(d.sort, trg);
			assert(idx!=-1);
			int nei = d[(idx+1)%d.length];
			set.remove(trg);
			
			d = set.keys;
			idx = bs(d.sort, nei);

			idx+=m-1;
			idx%=d.length;
			
			debug(1){
				dbg(d[idx]+1, trg+1, set.keys.sort);
				readln;
			}
			
			trg = d[idx];
		}
		
		(set.keys[0]+1).writeln;
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