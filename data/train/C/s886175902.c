#include<stdio.h>
#include<string.h>

int main(void)
{
  int i, j, k;
  double tmp;
  double a[2][3];
  double x[2];

  memset(a,0,sizeof(a));
  memset(x,0,sizeof(x));

  while(1){
	for (i = 0;i < 2;i++){
	  for (j = 0;j < 3;j++){
		if (scanf("%lf", &a[i][j]) == EOF){
		  return 0;   
		}
	  }
	}

	for (i = 0;i < 2;i++){
	  if (a[i][i] == 0){
		for (j = i + 1;j < 2;j++){
		  if (a[j][i] != 0){
			for (k = 0;k < 2;k++){
			  tmp = a[i][k];
			  a[i][k] = a[j][k];
			  a[j][k] = tmp;
			}
			break;
		  }
		}
	  }
	}

	for (i = 0;i < 2;i++){
	  for (j = i + 1;j < 2;j++){
		tmp = a[j][i] / a[i][i];
		for (k = i;k < 3;k++){
		  a[j][k] -= a[i][k] * tmp;
		}
	  }
	}

	for (i = 2 - 1;i >= 0;i--){
	  for (j = 2;j > i + 1;j--){
		a[i][j-1] = a[i][j] - (x[j-1] * a[i][j-1]);
	  }
	  x[i] = a[i][i+1] / a[i][i];
	}

	for (i = 0;i < 2;i++){
	  if (i == 0){
		 printf("%.3lf ", x[i]);
	  }
	  else if (i == 1){
		printf("%.3lf", x[i]);
	  }
	}
	printf("\n");
	memset(a,0,sizeof(a));
	memset(x,0,sizeof(x));
  }

  return 0;
}