import std.stdio : write, writeln;
import std.array;
import std.range;

void main(){
	const heisei = 19890108;
	const showa = 19261225;
	const taisho = 19120730;
	const meiji = 18680908;
	while(hasNext){
		string y = next!string();
		string m = next!string();
		string d = next!string();
		
		if(m.length<2){
			m = "0" ~ m;
		}
		if(d.length<2){
			d = "0" ~ d;
		}
		
		int a = (y ~ m ~ d).to!int;
		
		if(heisei <= a){
			writeln = heisei.stringof ~ " " ~ (y.to!int - heisei.to!string.take(4).array.to!int + 1).to!string ~ " " ~ m.to!int.to!string ~ " " ~ d.to!int.to!string;
		}else if(showa <= a){
			writeln = showa.stringof ~ " " ~ (y.to!int - showa.to!string.take(4).array.to!int + 1).to!string ~ " " ~ m.to!int.to!string ~ " " ~ d.to!int.to!string;
		}else if(taisho <= a){
			writeln = taisho.stringof ~ " " ~ (y.to!int - taisho.to!string.take(4).array.to!int + 1).to!string ~ " " ~ m.to!int.to!string ~ " " ~ d.to!int.to!string;
		}else if(meiji <= a){
			writeln = meiji.stringof ~ " " ~ (y.to!int - meiji.to!string.take(4).array.to!int + 1).to!string ~ " " ~ m.to!int.to!string ~ " " ~ d.to!int.to!string;
		}else{
			writeln = "pre-meiji";
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