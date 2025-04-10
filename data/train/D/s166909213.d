import std.stdio;
import std.algorithm;
import std.string;
import std.conv;
import std.math;

void main(){

    while(true){
	int[] cards;
	auto s = readln();
	if(stdin.eof()) break;
	auto s1 = split(chomp(s),',');
	for(int i=0;i<5;i++){
	    cards ~= to!int(s1[i]);
	}
	
	sort(cards);
//	foreach(i;cards) writeln(i);
	bool flg = false;

	int count = 0;
	for(int i=0;i<5;i++){
	    count = 0;
	    for(int j=0;j<5;j++){
		if(cards[i] == cards[j]) count++;
	    }
	    if(count==4) {
		writeln("four card");
		flg = true;
		break;
	    }
	}

	if(!flg){
	    bool three=false, two=false;
	    for(int i=0;i<5;i++){
		count = 0;
		for(int j=0;j<5;j++){
		    if(cards[i]==cards[j]) count++;
		}
		if(count==3) three = true;
		if(count==2) two = true;
		if(three&&two){
		    writeln("full house");
		    flg = true;
		    break;
		}
	    }
	}

	if(!flg){
	    bool st=true;
	    if(cards[0]==1&&cards[1]==10)cards[0]=9;
	    for(int i=0;i<4;i++){
		if(cards[i+1]-cards[i]!=1) st = false;
	    }
	    if(st){
		writeln("straight");
		flg = true;
	    }
	}

	if(!flg){
	    bool three=false;
	    for(int i=0;i<5;i++){
		count = 0;
		for(int j=0;j<5;j++){
		    if(cards[i]==cards[j]) count++;
		}
		if(count==3) three = true;
		if(three){
		    writeln("three card");
		    flg = true;
		    break;
		}
	    }
	}

	if(!flg){
	    int p1,p2;
	    for(int i=0;i<5;i++){
		count = 0;
		for(int j=0;j<5;j++){
		    if(cards[i]==cards[j]&&p1!=cards[i]) count++;
		}
		if(count==2&&p1>0) p2 = cards[i];
		if(count==2) p1 = cards[i];
		if(p1&&p2){
		    writeln("two pair");
		    flg=true;
		    break;
		}
	    }
	    if(p1&&!flg){
		writeln("one pair");
		flg = true;
	    }
	}

	if(!flg) writeln("null");
    }
}