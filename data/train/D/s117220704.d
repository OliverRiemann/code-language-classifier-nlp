import std.stdio : writeln, write, stdin;
import std.array;
import std.range;
import std.algorithm : max;


void main(){
	int n = next!int();
	for(int i=0; i<n; ++i){
		readln;
		
		bool[8][8] map;
		for(int y=0; y<8; ++y){
			string str = next!string();
			for(int x=0; x<8; ++x){
				map[y][x] = str[x]=='1';
			}
		}
		int X = next!int() -1;
		int Y = next!int() -1;
		
		int[2][] queue;
		queue ~= [X, Y];
		while(queue.length > 0){
			auto p = queue.front;
			queue.popFront;
			
			int x_ = p[0];
			int y_ = p[1];
			if(map[y_][x_]){
				map[y_][x_] = false;
				for(int x = x_-3; x <= x_+3; ++x){
					if(0<=x && x<8){
						if(map[y_][x]){
							queue ~= [x, y_];
						}
					}
				}
				for(int y = y_-3; y <= y_+3; ++y){
					if(0<=y && y<8){
						if(map[y][x_]){
							queue ~= [x_, y];
						}
					}
				}
			}
		}
		
		writeln("Data ", i+1, ":");
		for(int y=0; y<8; ++y){
			for(int x=0; x<8; ++x){
				write(map[y][x] ? 1 : 0);
			}
			write('\n');
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