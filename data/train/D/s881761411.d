import std.stdio : readln, writeln, chomp, stdin;
import std.conv : to;
import std.algorithm : min;

int[] solve(int[13] d)
{
	int[] ans;
	int[9] map = 0;			// 値の分布
	foreach(v; d){
		++map[v-1];
	}

	foreach(i; 0..9){
		int[9] arr = map.dup;
		++arr[i];
		// 1.入力のせいにしてみる、
		bool flag = false;
		foreach(ite; arr){
			flag |= 4<ite;
		}
		if(flag)continue;
		if(search(arr.idup, 0)){
			ans ~= (i+1);
		}
	}
	
	return ans;
}

bool search(immutable int[] map, int index)
{
	// 3.本体に参照させないようにする
	auto arr = map.dup;
	bool[(9-3)+1] list = arr.renew;
	if(index>=list.length){
		auto tmp = arr.dup;
		foreach(ref ite; tmp){
			ite %= 3;
		}
		foreach(ref ite; tmp){
			if(ite==2){
				ite=0;
				break;
			}
		}
		bool flag = true;
		foreach(ite; tmp){
			flag &= ite==0;
		}
		return flag;
	}
	if(list[index]){
		bool flag = false;
		flag |= search(arr.idup, index+1);
		auto tmp = arr.dup;
		// 2.一度にひとつずつ消してみる
		while(list[index]){
			for(int i=0; i<3; ++i){
				--tmp[index+i];
			}
			list = tmp.renew;
			// 4.途中のものも投げてみる...
			flag |= search(tmp.idup, index+1);
		}
		return flag;
	}else{
		return search(arr.idup, index+1);
	}
}

bool[(9-3)+1] renew(int[] arr)
{
	bool[(9-3)+1] list = true;
	for(int j=0; j<=9-3; ++j){
		for(int k=0; k<3; ++k){
			list[j] &= arr[j+k]>0;
		}
	}
	return list;
}

/+
int getMin(int[] arr, int index)
{
	int[3] f = 0;
	for(int k=0; k<3; ++k){
		f[k] = arr[index+k];
	}
	return min(f[0], f[1], f[2]);
}
+/

void main()
{
	io();
}

void io()
{
	while(true){
		string str = readln.chomp;
		if(stdin.eof())break;
		int[13] d;
		foreach(i, c; str){
			d[i] = c-'0';
		}
		int[] ans = d.solve;
		if(ans.length>0){
			string _ans = "";
			for(int i=0; i<ans.length; ++i){
				_ans ~= ans[i].to!string;
				if(i+1<ans.length){
					_ans ~= " ";
				}
			}
			_ans.writeln;
		}else{
			writeln = 0;
		}
	}
}