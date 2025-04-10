/*

aとbの最小公倍数、最大公約数を求めよ。
aとbは20億以下とする。
ただし、公倍数も20億以下とする。

やり方：
	・aとbを入力。
	・最小公倍数を求める関数koubai00と、最大公約数を求める関数kouyaku00を使い、
		配列2つ（koubai[]とkouyaku[]）にそれぞれ記録していく。
	・表示して終わり。

結果：Run time error

何がおかしいのだろう。
普通に実行できるのだが。

*/
#include <stdio.h>

int koubai00(int a, int b);		//最小公倍数を求める関数。詳細は下部。
int kouyaku00(int a, int b);		//最大公約数を求める関数。ユークリッドさんの互除法。

int main()
{
	int a,b;
	int i=0,count;
	int koubai,kouyaku;
	int ret;
	while(1){
		ret=scanf("%d %d",&a, &b);
		if(ret==EOF){
			break;
		}
		koubai=koubai00(a, b);
		kouyaku=kouyaku00(a, b);
		printf("%d %d\n",kouyaku, koubai);
	}
    return 0;
}

int koubai00(int a, int b)				//最小公倍数を求める関数。
{										//A*B=最大公約数*最小公倍数		らしい。
	int small,big;
	int r;
	int result;
	if(a<b){
		small=a;
		big=b;
	}
	else if(a>b){
		small=b;
		big=a;
	}
	else{
		return a;
	}
	while(small!=0){
		r=big%small;
		big=small;
		small=r;
	}
	result=(a/big)*b;
	return result;
}

int kouyaku00(int a, int b)				//最大公約数を求める関数。ユークリッドさんの互除法。
{
	int r;
	int small,big;
	if(a<b){
		small=a;
		big=b;
	}
	else if(a>b){
		small=b;
		big=a;
	}
	else{
		return a;
	}
	while(small!=0){
		r=big%small;
		big=small;
		small=r;
	}
	return big;
}