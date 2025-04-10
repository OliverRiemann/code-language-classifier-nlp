#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#define REP(i,a,b) for(i=a;i<b;i++)
#define rep(i,n) REP(i,0,n)

#define N 2

void gauss(double a[N][N+1]){
  int i,j,k,l,pivot;
  double x[N];
  double p,q,m,b[1][N+1];

  rep(i,N){
    m = 0;
    pivot = i;

    REP(l,i,N) if(fabs(a[l][i]) > m){
      m = fabs(a[l][i]);
      pivot = l;
    }

    if(pivot != i) rep(j,N+1){
      b[0][j] = a[i][j];
      a[i][j] = a[pivot][j];
      a[pivot][j] = b[0][j];
    }
  }

  rep(k,N){
    p = a[k][k];
    a[k][k] = 1;

    REP(j,k+1,N+1) a[k][j] /= p;
    REP(i,k+1,N){
      q = a[i][k];
      REP(j,k+1,N+1) a[i][j] -= q * a[k][j];
      a[i][k] = 0;
    }
  }

  for(i=N-1; i>=0; i--){
    x[i] = a[i][N];
    for(j=N-1; j>i; j--){
      x[i] -= a[i][j] * x[j];
    }
  }

//  rep(i,N) printf("%lf",x[i]);
  printf("%.3lf %.3lf\n", x[0], x[1]);
}

int main(){
  int i,j;
  double a[N][N+1];

  while(scanf("%lf %lf %lf %lf %lf %lf",&a[0][0],&a[0][1],&a[0][2],&a[1][0],&a[1][1],&a[1][2]) != EOF){
    gauss(a);
  }

  return 0;
}