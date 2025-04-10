import std.stdio : write;
import std.array;
import std.range;

void main(){
	while(hasNext){
		
		for(char* p = (next!string().dup ~ "\0").ptr; *p!='\0'; ++p){
			if(*p == '@'){
				int l = *(++p) - '0';
				++p;
				foreach(i; l.iota){
					(*p).to!string.write;
				}
			}else{
				(*p).to!string.write;
			}
		}
		"\n".write;
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