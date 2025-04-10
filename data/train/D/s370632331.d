import std.stdio : writeln, write;
import std.array;
import std.range;

int n;
int m;
int star;
int d;
bool[][] map;

int[] dir = [-1, 0];

int[] solve(){
	int[] foot;
	int a = m;
	for(int i=0; i<d; ++i){
		if(map[i][a]){
			++a;
		}else if(map[i][a-1]){
			--a;
		}
		foot ~= a;
	}
	if(a == star) return [0];
	
	debug{foot.dbg;}
	
	bool[][] tmp = map.clone;
	
	a = m;
	for(int i=0; i<d; ++i){
		if(a==foot[i]){
			debug {(i+1).dbg;}
			for(int j=0; j<2; ++j){
				map = tmp.clone;
				map[i][dir[j]+a] = true;
				debug{map[i].dbg;}
				
				bool f = false;
				f |= map[i][0];
				for(int k=1; k<n; ++k){
					f |= map[i][k] && map[i][k+1];
				}
				f |= map[i][n];

				if(!f){
					int ptr = a;
					debug{ dbg("ptr", ptr, "dir", dir[j]); }
					if(j==0){
						--ptr;
					}else{
						++ptr;
					}
					for(int k=i+1; k<d; ++k){
						debug{ dbg("ptr", ptr); }
						if(map[k][ptr]){
							++ptr;
						}else if(map[k][ptr-1]){
							--ptr;
						}
					}
					debug{ dbg("ptr", ptr); }
					
					if(ptr == star){
						return [i+1, a+dir[j]];
					}else{
						debug {dbg("failed", i+1, a+dir[j]);}
					}
				}else{
					debug {dbg("cannot");}
				}
			}
		}else{
			a=foot[i];
		}
	}

	return [1];
}

void main(){
	while(true){
		n.next;
	
		if(n==0)break;
		m.next;
		star.next;
		d.next;
		
		for(int i=0; i<d; ++i) map.nmap;
		
		debug{ map.dbg; }
		
		auto ans = solve;
		for(int i=0; i<ans.length; ++i){
			write = ans[i];
			if(i+1<ans.length){
				write = " ";
			}
		}
		writeln;
		
		map = map.init;
	}
}

void nmap(ref bool[][] m){
	string str = readln.chomp;
	bool[] m_;
	m_ ~= false;
	foreach(c; str){
		m_ ~= c=='1';
	}
	m_ ~= false;
	m ~= m_;
}

import std.stdio : readln, chomp;
import std.conv : to;
import std.string : split;
shared string[] input;
shared string delim = " ";
T next(T)()
in
{
	if(input.length==0){
		input ~= readln.chomp.split(delim);
	}
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