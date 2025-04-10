import std.stdio;
import std.conv;
import std.algorithm;
import std.string;
import std.file;
import std.math;

int main() {
	char[] digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
	
	string l1, l2;
	readln();
	while((l1 = readln(), l1.length)){
		bool overflow = false;
		
		l2 = readln();
		if(!l1.split.length || !l2.split.length) break;
		
		char[] a, b, c;
		for(int i=0; i<80; i++) c ~= '0';
		
		a = cast(char[]) l1.split("\n")[0];
		if(a.length > 80) overflow = true;
		a = c ~ a;
		a = a[$ - 80 .. $];
		
		b = cast(char[]) l2.split("\n")[0];
		if(b.length > 80) overflow = true;
		b = c ~ b;
		b = b[$ - 80 .. $];
		
		for(int i = 79; i >= 0; i--){
			int t = (c[i] - '0') + (a[i] - '0') + (b[i] - '0');
			if(t >= 10){
				if(i == 0) overflow = true, t = 0;
				else while(t >= 10) c[i-1] += 1, t -= 10;
				}
			c[i] = digits[t];
			}
		if(overflow) printf("overflow\n");
		else{
			int i;
			for(i = 0; i < 79; i++){
				if(c[i] != '0') break;
				}
			c = c[i .. $];
			write(c ~ '\n');
			}
		}
	return 0;
	}