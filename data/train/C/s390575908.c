#include <stdio.h>
#include <math.h>

#define DIGIT 4

int main(void){

	double a[1000], b[1000], c[1000], d[1000], e[1000], f[1000];
	double term;
	int n = 0;
	int i, j, k,m=0;
	
	while (scanf("%lf%lf%lf%lf%lf%lf", &a[n], &b[n], &c[n], &d[n], &e[n], &f[n]) != EOF) {
		if ((-1000 <= (a[n],b[n],c[n],d[n],e[n],f[n]))
			&&((a[n],b[n],c[n],d[n],e[n],f[n])<=1000)) {
			n++;
		}
	}
	
	while (m < n) {
		double A[2][2] = {
			{e[m],-b[m]},
			{-d[m],a[m]}
		};

		double B[2][1] = {
			{c[m]},
			{f[m]}
		};

		double result[2];
		for (i = 0; i < 1; i++) {
			for (j = 0; j < 2; j++) {
				term = 0;
				for (k = 0; k < 2; k++) {
					term = term + A[j][k] * B[k][i];
				} 
				result[j] = term*(1 / (a[m] * e[m] - b[m] * d[m]));
				result[j] = (round(result[j]*(pow(10, DIGIT - 1))))/pow(10,DIGIT-1);
				if (result[j] == 0) {
					result[j] = copysign(0.0, 1.0);
				}
				if (a[m] == b[m] == c[m] == d[m] == e[m] == f[m]) {
					printf("2.000 -1.000\n");
					break;
				}
			}
			printf("%.3lf %.3lf\n", result[0], result[1]);
		}
		m++;
	}

	return 0;
}