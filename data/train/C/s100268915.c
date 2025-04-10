#include <stdio.h>
#include <math.h>
//#define D(fmt,...) fprintf(stderr, fmt, ##__VA_ARGS__)
#define D(fmt,...) 
#define P(fmt,...) fprintf(stdout, fmt, ##__VA_ARGS__)


int gcd (int a, int b) {
  int small = a < b ? a : b;
  int big = a < b ? b : a;
  int gcd  = 1;
  int i = 1;
  for (i = 2; i < small; i++) {
    int countA = 0;
    while (small % i == 0) {
      countA++;
      small /= i;
    }
    int countB = 0;
    while (big % i == 0) {
      countB++;
      big /= i;
    }
    if (countA != 0 && countB != 0) {
      int count = countA < countB ? countA:countB;
      D("%d ^ %d = %f\n", i, count, floor(pow(i, count)));
      gcd *= floor(pow(i,count));
    }
    D("i=%d\n", i);
  }

  return gcd;
}

int lcm (int a, int b, int g) {
  int lcm = 0;
  int min = a < b ? a : b;
  int x = a / g;
  int y = b / g;
  return g * x * y;
}
		      
int main (int ac, char **av)
{
  while(feof(stdin) == 0) {
    int a, b = 0;
    fscanf(stdin, "%d %d\n", &a, &b);
    int g = gcd(a, b);
    P("%d %d\n", g, lcm(a, b, g));
  }
  return 0;
}