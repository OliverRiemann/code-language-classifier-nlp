import std.stdio : write, writeln, writefln, stdin;
import std.array;
import std.range;
import std.algorithm : max;

void main(){
	int[] d = [readln.chomp.to!int];
	while(true){
		auto str = readln.chomp.split(",");
		if(stdin.eof()) break;
		
		int[] r;
		foreach(i; str){
			r ~= i.to!int;
		}
		int[] d_ = repeat(0).take(r.length).array;
		
		if(r.length > d.length){
			for(int i=0; i<d.length; ++i){
				d_[i] = max(d_[i], r[i]+d[i]);
				d_[i+1] = max(d_[i+1], r[i+1]+d[i]);
			}
		}else{
			d_[0] = max(d_[0], r[0]+d[0]);
			for(int i=1; i<d.length-1; ++i){
				d_[i] = max(d_[i], r[i]+d[i]);
				d_[i-1] = max(d_[i-1], r[i-1]+d[i]);
			}
			d_[$-1] = max(d_[$-1], r[$-1]+d[$-1]);
		}
		
		d = d_.clone;
	}
	
	d.front.writeln;
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