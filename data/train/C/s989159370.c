/*
問題内容：
某国に住んでいる友達がお金に困って、あるヤミ金融業者から 10 万円の借金をしたまま、全く返済していないといいます。
この業者は、一週間ごとに 5% の利子を借金に加え、さらに借金の 1,000 円未満を切り上げます。

n を入力したとき、n 週間後の借金の残高を出力し終了するプログラムを作成して下さい。n は 100 以下とします。

・手順：
・第六回授業で使用したプログラムを再利用。
・変更点は、切り上げの部分。
・なぜか不正解。
*/
#include <stdio.h>
#include <math.h>

double ceil00(double n, int i);

int main()
{
	int n,i;
	double result=100000;
	while(1){
		scanf("%d",&n);
		if(0<n&&n<=100){			//nが1〜100でなければやり直す。
			break;
		}
	}
	for(i=1; i<=n; i++){
		result+=(result*5/100);			//5%増やす。
		result=ceil00(result,-3);
	}
	printf("%d\n",(int)result);
    return 0;
}

double ceil00(double n, int i)
{
	if(i==-5){
		n/=100000;
		n=ceil(n);
		n*=100000;
	}
	else if(i==-4){
		n/=10000;
		n=ceil(n);
		n*=10000;
	}
	else if(i==-3){
		n/=1000;
		n=ceil(n);
		n*=1000;
	}
	else if(i==-2){
		n/=100;
		n=ceil(n);
		n*=100;
	}
	else if(i==-1){
		n/=10;
		n=ceil(n);
		n*=10;
	}
	else if(i==1){
		n=ceil(n);
	}
	else if(i==2){
		n*=10;
		n=ceil(n);
		n/=10;
	}
	else if(i==3){
		n*=100;
		n=ceil(n);
		n/=100;
	}
	else if(i==4){
		n*=1000;
		n=ceil(n);
		n/=1000;
	}
	else if(i==5){
		n*=10000;
		n=ceil(n);
		n/=10000;
	}
	return n;
}