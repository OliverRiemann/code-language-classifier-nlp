import std.stdio;
import std.algorithm;
import std.string;
import std.functional;
import std.array;
import std.conv;
import std.math;
import std.typecons;
import std.regex;
import std.range;

void main(){

    while(true){
	int n = readln().chomp().to!int;
	if(n==0)break;
	int m = readln().chomp().to!int;
	int p = readln().chomp().to!int;
	int d = readln().chomp().to!int;
	string[] s;
	int[11] h;
	for(int i=0;i<11;i++) h[i] = i;
	for(int i=0;i<d;i++){
	    s ~= readln().chomp();
	    for(int j=0;j<n-1;j++){
		if(s[i][j] == '1'){
		    swap(h[j+1],h[j+2]);
		}
	    }
	}
	bool flg = false;
	if(h[p] == m) {
	    writeln(0);
	    flg = true;
	}
	else{
	    for(int i=0;i<d;i++){
		for(int j=0;j<n-1;j++){
		    if(j<n-2 && s[i][j+1] == '1' ) continue;
		    if(j>0 && s[i][j-1] == '1' ) continue;

		    int[11] h1;
		    for(int i1=0;i1<11;i1++) h1[i1] = i1;

		    for(int k=0;k<d;k++){
			for(int l=0;l<n-1;l++){
			    if(s[k][l] == '1' ||(k==i&&l==j)){
				swap(h1[l+1],h1[l+2]);
			    }
			}
		    }
		    if(h1[p]==m){
			flg = true;
			writeln(i+1," ",j+1);
			break;
		    }
		}
		if(flg) break;
	    }
	}
	if(!flg) writeln(1);
    }
}