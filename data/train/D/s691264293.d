import std.stdio;
import std.string;
import std.math;
import std.conv;
import std.algorithm;
import std.bigint;

void main(){

    int[10][10] map;
    while(true){
	auto s = split(chomp(readln()),',');
	if(stdin.eof()) break;
	int x,y,size;
	x = to!int(s[0]);
	y = to!int(s[1]);
	size = to!int(s[2]);

	if(size >0){
	    auto d = [1,0,-1,0 ,0];
	    auto d1 = [0,1,0,-1,0];
	    for(int i=0;i<5;i++){
		if(0 <= d[i] + x &&  d[i] + x < 10 && 0 <= d1[i] + y &&  d1[i] + y < 10){
		    map[d[i] + x][d1[i] + y]++;
		}
	    }
	}
	size--;
	if(size>0){
	    auto d = [ 1,-1];
	    for(int i=0;i<2;i++){
		for(int j=0;j<2;j++){
		    if(0 <= d[i] + x &&  d[i] + x < 10 && 0 <= d[j] + y &&  d[j] + y < 10){
			map[d[i] + x][d[j] + y]++;
		    }
		}
	    }
	}
	size--;
	if(size>0){
	    auto d = [2,0,-2,0,0];
	    auto d1 = [0,2,0,-2,0];
	    for(int i=0;i<5;i++){
		if(0 <= d[i] + x &&  d[i] + x < 10 && 0 <= d1[i] + y &&  d1[i] + y < 10){
		    map[d[i] + x][d1[i] + y]++;
		}
	    }
	}
    }
    int ans1 = 0,ans2=0;
    for(int i=0;i<10;i++){
	for(int j=0;j<10;j++){
	    if(map[i][j] == 0) ans1++;
	    ans2 = max(map[i][j] , ans2);
	}
    }
    writeln(ans1);
    writeln(ans2);
}