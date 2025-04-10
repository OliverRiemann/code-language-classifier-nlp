import std.stdio : write, writeln, writefln, stdin;
import std.array;
import std.range;

void main(){
	string[char] en = [
		' '	: "101",
		'\''	: "000000",
		','	: "000011",
		'-'	: "10010001",
		'.'	: "010001",
		'?'	: "000001",
		'A'	: "100101",
		'B'	: "10011010",
		'C'	: "0101",
		'D'	: "0001",
		'E'	: "110",
		'F'	: "01001",
		'G'	: "10011011",
		'H'	: "010000",
		'I'	: "0111",
		'J'	: "10011000",
		'K'	: "0110",
		'L'	: "00100",
		'M'	: "10011001",
		'N'	: "10011110",
		'O'	: "00101",
		'P'	: "111",
		'Q'	: "10011111",
		'R'	: "1000",
		'S'	: "00110",
		'T'	: "00111",
		'U'	: "10011100",
		'V'	: "10011101",
		'W'	: "000010",
		'X'	: "10010010",
		'Y'	: "10010011",
		'Z'	: "10010000",
	];
	char[string] de = [
		"00000" : 'A',
		"00001" : 'B',
		"00010" : 'C',
		"00011" : 'D',
		"00100" : 'E',
		"00101" : 'F',
		"00110" : 'G',
		"00111" : 'H',
		"01000" : 'I',
		"01001" : 'J',
		"01010" : 'K',
		"01011" : 'L',
		"01100" : 'M',
		"01101" : 'N',
		"01110" : 'O',
		"01111" : 'P',
		"10000" : 'Q',
		"10001" : 'R',
		"10010" : 'S',
		"10011" : 'T',
		"10100" : 'U',
		"10101" : 'V',
		"10110" : 'W',
		"10111" : 'X',
		"11000" : 'Y',
		"11001" : 'Z',
		"11010" : ' ',
		"11011" : '.',
		"11100" : ',',
		"11101" : '-',
		"11110" : '\'',
		"11111" : '?',
	];
	
	while(true){
		string str = readln.chomp;
		if(stdin.eof) break;
		string p;
		foreach(c; str){
			p~=en[c];
		}
		string[] q;
		while(p.length>0){
			if(p.length < 5){
				q ~= p.take(p.length).array.to!string ~ repeat('0').take(5-p.length).array.to!string;
				for(auto l=p.length; 0<l; --l){
					p.popFront;
				}
			}else{
				q ~= p.take(5).array.to!string;
				foreach(i; 5.iota){
					p.popFront;
				}
			}
		}
		
		string ans;
		foreach(ite; q){
			ans ~= de[ite];
		}
		
		ans.writeln;
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