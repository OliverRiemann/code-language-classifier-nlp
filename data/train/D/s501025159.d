import std.stdio,std.string,std.conv,std.math;

immutable MIN = -1000;
immutable MAX = 1000;

int main(string[] argv)
{
    char[] buf;
	string[] ans;
	while(stdin.readln(buf)){
		if(checkSeak(buf)){
			double[] num;
			foreach(string str;buf.to!string().chomp().split(" ")){
				num ~= str.to!double();
			}
			double x = (num[2] * num[4] - num[1] * num[5]) / (num[0] * num[4] - num[1] * num[3]);
			double y = (num[5] * num[0] - num[2] * num[3]) / (num[0] * num[4] - num[3] * num[1]);
			x = roundD(x,4);
			y = roundD(y,4);
			ans ~= format("%.3f %.3f",x,y).to!string(); 
		}
	}

	foreach(string str;ans){
		writeln(str);
	}

    return 0;
}

 

private bool checkLength(char[] c){
	if(c.split(" ").length == 6){
		return true;
	}
	return false;
}

private bool checkRange(char[] c){
	try{
		foreach(string str;c.to!string().chomp().split(" ")){
			double tmp = str.to!double();
			if (MIN <= tmp && tmp <= MAX){
			}else{
				return false;
			}
		}
	}
	catch(Exception ex){
		//writeln("Cast_Error!");
		return false;
	}

	return true;
}

private bool checkSeak(char[] c){
	if(checkLength(c)){
		//writeln("Length==>OK.");
	}else{
		return false;
	}
	if(checkRange(c)){
		//writeln("Range===>OK.");
	}else{
		return false;
	}

	return true;
}

private double roundD(double d,uint i){
	double result = round(d * pow(10,i-1))/pow(10,i-1);
	if (result == -0) {
		return 0;
	}
	return result;
}