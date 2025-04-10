/*

連立方程式「ax+by=c, dx+ey=f」の解を求めよ。

結果：Time limit exceeded

連立方程式を解くのに苦労した。
タイムリミットと言われても、どうしたものか。

----------------------------------------------------------------------

13:35 2013/01/19

10027の例に倣い、配列ではなくした。これで軽くなっただろう。
・・・それでも駄目だった。

結果：Time limit exceeded

----------------------------------------------------------------------

23:06 2013/02/06

式の変形をすると、

x=(ce-bf)/(ae-bd);
y=(cd-af)/(bd-ae);

だ、そうで。

サンプルと同じ結果は出るものの、送ったらWAが返ってきた。はて。

結果：Wrong answer

*/
#include <stdio.h>
#include <math.h>

double yosute00(double n, int i);									//指定した整数の桁で四捨五入を行う関数。（1→小数点第一位、2→小数点第二位、.....-1→1の位、-2→2の位）

int main()
{
	double a,b,c,d,e,f,x,y;
	int i=0,count=0;
	double sp;
	int cal,ret;
	while(1){
		ret=scanf("%lf %lf %lf %lf %lf %lf",&a,&b,&c,&d,&e,&f);
		if(ret==EOF){
			break;
		}
		x = ((c*e)-(b*f)) / ((a*e)-(b*d));
		y = ((c*d)-(a*f)) / ((b*d)-(a*e));
		x = yosute00(x, 4);
		y = yosute00(y, 4);
		printf("%.3f %.3f\n",x,y);
	}
	return 0;
}

double yosute00(double n, int i)
{
	switch(i){
		case -5:
			n/=100000;
			n+=0.5;
			n=floor(n);
			n*=100000;
			break;
		
		case -4:
			n/=10000;
			n+=0.5;
			n=floor(n);
			n*=10000;
		
		case -3:
			n/=1000;
			n+=0.5;
			n=floor(n);
			n*=1000;
		
		case -2:
			n/=100;
			n+=0.5;
			n=floor(n);
			n*=100;
		
		case -1:
			n/=10;
			n+=0.5;
			n=floor(n);
			n*=10;
		
		case 1:
			n+=0.5;
			n=floor(n);
			break;
		
		case 2:
			n*=10;
			n+=0.5;
			n=floor(n);
			n/=10;
			break;
		
		case 3:
			n*=100;
			n+=0.5;
			n=floor(n);
			n/=100;
			break;
		
		case 4:
			n*=1000;
			n+=0.5;
			n=floor(n);
			n/=1000;
			break;
		
		case 5:
			n*=10000;
			n+=0.5;
			n=floor(n);
			n/=10000;
			break;
	}
	return n;
}