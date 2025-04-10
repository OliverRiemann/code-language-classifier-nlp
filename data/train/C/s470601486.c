#include<stdio.h>
#include<stdlib.h>

//直角三角形かどうかを判定する関数
int isRightTriangle(int a, int b, int c);
  
//main関数
int main(){
  int i;
  int N;
  int a,b,c;
  int *ans;

  //1行目にデータセット数Nが与えられる。
  scanf("%d",&N);
  //ansの配列の要素数Nを動的に確保
  ans = (int *)malloc(sizeof(int) * N);

  //三角形の3辺a,b,c
  for(i=0;i<N;i++){
    scanf("%d %d %d",&a, &b, &c);
    ans[i] = isRightTriangle(a, b, c); //ans[i] = 1 or 0
  }
  
  //output
  for(i=0; i<N; i++){
    if(ans[i] == 1){
      printf("YES\n");
    }
    else{
      printf("NO\n");
    }
  }

  free(ans);
  return 0;
}

int isRightTriangle(int n1, int n2, int n3){
  int a,b,c;

  //n1とn2とn3がどれが一番大きい辺か調べる
  if(n1 >= n2 && n1 >= n3){
    c=n1; a=n2; b=n3;
  }
  else if(n2 >= n1 && n2 >= n3){
    c=n2; a=n1; b=n3;
  }
  else{
    c=n3; a=n1; b=n2;
  }

  //直角三角形ならば、三平方の定理が成り立つ。
  if(c*c == a*a + b*b){ //成り立つならば1を返す
    return 1;
  }
  else{                 //成り立たないならば0を返す
    return 0;
  }
}