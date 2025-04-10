import std.stdio;
import std.conv;
import std.string;
import std.algorithm;
import std.math;

void main(){

    while(true){
	string[] s = [];
	for(int i=0;i<8;i++){
	    string temp = readln();
	    if(stdin.eof()) break;
	    s ~= chomp(temp);
	}
	if(stdin.eof()) break;

	string ans = "none";
	for(int i=0;i<7;i++)
	    for(int j=0;j<7;j++)
		if(s[i][j]=='1'&&s[i][j+1]=='1'&&s[i+1][j]=='1'&&s[i+1][j+1]=='1') ans = "A";

	for(int i=0;i<5;i++)
	    for(int j=0;j<8;j++)
		if(s[i][j]=='1'&&s[i+1][j]=='1'&&s[i+2][j]=='1'&&s[i+3][j]=='1') ans = "B";

	for(int i=0;i<8;i++)
	    for(int j=0;j<5;j++){
		if(s[i][j]=='1'&&s[i][j+1]=='1'&&s[i][j+2]=='1'&&s[i][j+3]=='1') ans = "C";
	    }

	for(int i=0;i<6;i++)
	    for(int j=1;j<8;j++)
		if(s[i][j]=='1'&&s[i+1][j]=='1'&&s[i+1][j-1]=='1'&&s[i+2][j-1]=='1') ans = "D";

	for(int i=0;i<7;i++)
	    for(int j=0;j<6;j++)
		if(s[i][j]=='1'&&s[i][j+1]=='1'&&s[i+1][j+1]=='1'&&s[i+1][j+2]=='1') ans = "E";

	for(int i=0;i<6;i++)
	    for(int j=0;j<7;j++)
		if(s[i][j]=='1'&&s[i+1][j]=='1'&&s[i+1][j+1]=='1'&&s[i+2][j+1]=='1') ans = "F";

	for(int i=0;i<7;i++)
	    for(int j=1;j<7;j++)
		if(s[i][j]=='1'&&s[i][j+1]=='1'&&s[i+1][j-1]=='1'&&s[i+1][j]=='1') ans = "G";

	writeln(ans);
	if(stdin.eof()) break;
	auto a = readln();
	if(stdin.eof()) break;
    }
}