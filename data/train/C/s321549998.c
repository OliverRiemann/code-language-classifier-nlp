/*

1000 以下の３つの正の整数を入力し、
それぞれの長さを３辺とする三角形が直角三角形である場合には YES を、
違う場合には NO と出力して終了するプログラムを作成して下さい。

手順：
・データセット数nを入力
・x,y,rを入力
	・x,y,rのいずれかが1以上1000以下の範囲になければ、その入力はカウントしない。（i--）
・r^2==(x^2+y^2)なら、YES
	そうでなければ、NOを表示する。
・データセット数（n）回繰り返して終了。

・結果：Wrong answer

なぜか不正解。
3つの入力の内、x,y,rを切り替えられるようにしてみたが、やはり不正解。（x^2==(y^2+r^2)とか、y^2==(x^2+r^2)とか。)

*/

#include <stdio.h>

int main()
{
	int x[1000],y[1000],r[1000];
	int i,count=0;
	int n;
	while(1){
		scanf("%d",&n);
		if(n<=1000){
			break;
		}
	}
	for(i=0; i<n; i++){
		scanf("%d %d %d",&x[i],&y[i],&r[i]);
		if(x[i]<1||x[i]>1000||y[i]<1||y[i]>1000||r[i]<1||r[i]>1000){
			i--;
		}
	}
	for(i=0; i<n; i++){
		if(r[i]*r[i]==(x[i]*x[i])+(y[i]*y[i])){
			printf("YES\n");
		}
		else if(x[i]*x[i]==(y[i]*y[i])+(r[i]*r[i])){
			printf("YES\n");
		}
		else if(y[i]*y[i]==(x[i]*x[i])+(r[i]*r[i])){
			printf("YES\n");
		}
		
		else{
			printf("NO\n");
		}
	}
    return 0;
}