#include <stdio.h>

unsigned long gcd(unsigned long a, unsigned long b);
unsigned long lcm(unsigned long a, unsigned long b, unsigned long g);

void swap(unsigned long *x, unsigned long *y)
{
  unsigned long tmp;
  tmp = *x;
  *x = *y;
  *y = tmp;
}

int main(void)
{
  unsigned long a[50], b[50];
  int i = 0;
  int n = 0;
  unsigned long gc[50], lc[50];

  while((scanf("%lu%lu", &a[i], &b[i])) != EOF){
    if((0 < a[i], b[i]) && (a[i], b[i] <= 2000000000)){
       i++;
       n++;
    }
    if(i > 50) break;
  }

  for(i = 0; i < n; i++){
    if(a[i] < b[i]) swap(&a[i], &b[i]);
    gc[i] = gcd(a[i], b[i]);
    lc[i] = lcm(a[i], b[i], gc[i]);
  }

  for(i = 0; i < n; i++){
    printf("%lu %lu\n", gc[i], lc[i]);
  }

    return 0;
}

unsigned long gcd(unsigned long a, unsigned long b)
{
  unsigned long r;

  if(a == b) return a;

  r = a%b;
  while(r != 0){
    a = b;
    b = r;
    r = a%b;
  }
  return b;
}

unsigned long lcm(unsigned long a, unsigned long b, unsigned long g)
{
  unsigned long l;

  l = (a*b)/g;

  return l;
}