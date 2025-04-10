import std.stdio : write, writeln, writefln, stdin;
import std.array;
import std.range;

void main(){
	while(true){
		double[] stack;
		
		bool start = false;
		string[] str = readln.chomp.split;
		if(stdin.eof) break;
		foreach(s; str){
			if(s=="+"){
				double t = stack.back;
				stack.popBack;
				double u = stack.back;
				stack.popBack;
				
				stack ~= u+t;
			}else if(s=="-"){
				double t = stack.back;
				stack.popBack;
				double u = stack.back;
				stack.popBack;
				
				stack ~= u-t;
			}else if(s=="*"){
				double t = stack.back;
				stack.popBack;
				double u = stack.back;
				stack.popBack;
				
				stack ~= u*t;
			}else if(s=="/"){
				double t = stack.back;
				stack.popBack;
				double u = stack.back;
				stack.popBack;
				
				stack ~= u/t;
			}else{
				stack ~= s.to!double;
			}
		}
		
		writefln("%.6f", stack.back);
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