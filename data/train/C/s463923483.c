/*

10種の山の高さが与えられる。高い順に3つ出力せよ。
山の高さは10000以下とする。

やり方：
	・データを配列に入力する。
		・高さが10000を超えていた場合はやり直す。
	・降順に並べ替える。
	・0番目〜2番目までの3つを出力する。
	
結果：正解。

*/
#include <stdio.h>
#include <math.h>
#include <string.h>
#include <ctype.h>

int sort00(int data[],int n);
int maxindex00(int data[], int from, int to);

int main()
{
	int i;
	int data[1000];
	for(i=0; i<10; i++){
		scanf("%d",&data[i]);
		if(data[i]>10000){
			i--;
		}
	}
	sort00(data,10);
	for(i=0;i<3;i++){
		printf("%d\n",data[i]);
	}
	return 0;
}

int sort00(int data[],int n)
{
	int i,work,maxindex;
	for(i=0;i<n;i++){
		maxindex=maxindex00(data,i,n);
		work=data[i];
		data[i]=data[maxindex];
		data[maxindex]=work;
	}
	return;
}

int maxindex00(int data[], int from, int to)
{
	int i;
	int result=from;
	for(i=from;i<to;i++){
		if(data[result]<data[i]){
			result=i;
		}
	}
	return result;
}