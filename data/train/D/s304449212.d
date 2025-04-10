import std.stdio,std.string,std.conv,std.array;
void main(){
	int[4][] data;
	for(int i=0;;i++){
		auto rd = readln().chomp();
		if(rd){
			data.length = i+1;
			auto abcd = split(rd);
			data[i][0] = to!int(abcd[0]);
			data[i][1] = to!int(abcd[1]);
			data[i][2] = to!int(abcd[2]);
			data[i][3] = to!int(abcd[3]);
		}else{
			break;
		}
	}
	for( int i=0;i<data.length;i+=2 ){
		int hit=0;
		if( data[i][0] == data[i+1][0] ){	hit+=1;	}
		if( data[i][1] == data[i+1][1] ){	hit+=1;	}
		if( data[i][2] == data[i+1][2] ){	hit+=1;	}
		if( data[i][3] == data[i+1][3] ){	hit+=1;	}
		write( hit , " " );
		int blow=0;
		if( data[i][0] == data[i+1][1] ){	blow+=1;	}
		if( data[i][0] == data[i+1][2] ){	blow+=1;	}
		if( data[i][0] == data[i+1][3] ){	blow+=1;	}
		
		if( data[i][1] == data[i+1][0] ){	blow+=1;	}
		if( data[i][1] == data[i+1][2] ){	blow+=1;	}
		if( data[i][1] == data[i+1][3] ){	blow+=1;	}

		if( data[i][2] == data[i+1][0] ){	blow+=1;	}
		if( data[i][2] == data[i+1][1] ){	blow+=1;	}
		if( data[i][2] == data[i+1][3] ){	blow+=1;	}
		
		if( data[i][3] == data[i+1][0] ){	blow+=1;	}
		if( data[i][3] == data[i+1][1] ){	blow+=1;	}
		if( data[i][3] == data[i+1][2] ){	blow+=1;	}
		writeln( blow );
	}
}