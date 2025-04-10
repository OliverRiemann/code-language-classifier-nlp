/*
	最大公約数を求めるためにユークリッドの互除法を利用する。
	____概要____
	A=Bq+r
	という式が与えられた時
	「AとBの公約数はBとrの公約数であるからGCD(A,B)とGCD(B,r)は一致する」
	____________
	上の式を変形して
	A/B=q...r
	つまり
	r=A%B
	となることを考えれば良い
	*/


#include<stdio.h>

unsigned long gcd(unsigned long, unsigned long);	//最大公約数
unsigned long lcm(unsigned long, unsigned long);	//最小公倍数

int main(void){
	unsigned long a, b;
	int i;
	unsigned long g, l;	//最大公約数と最小公倍数


	while (scanf("%d %d",&a,&b)!=EOF){
		g = gcd(a, b);
		l = lcm(a, b);
		printf("%d %d\n", g, l);
	}
	return 0;
}

unsigned long gcd(unsigned long a, unsigned long b){	//最大公約数を求める関数
	unsigned long big, small;
	unsigned long r;	//big/smallの余りをrに代入

	if (a == b){
		return a;
	}else if (a > b){
		big = a; small = b;
	}
	else if (a < b){
		big = b; small = a;
	}

	while (big%small != 0){
		r = big%small;
		if (small > r){
			big = small;
			small = r;
		}
		else if (small < r){
			big = r;
		}
		else if (small == r){
			big = r;
		}
	}
	return small;
}

unsigned long lcm(unsigned long a, unsigned long b){
	unsigned long l, g;

	g = gcd(a, b);

	l = a*b / g;

	return l;
}