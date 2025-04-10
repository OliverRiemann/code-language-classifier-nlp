#include <stdio.h>
int Maxcheck(int *p,int *q,int *r)
{
  int a,b,c;
  a=*p;b=*q;c=*r;
  int Max,m1,m2;
  if (a>b & a>c)
    {
      Max=a;m1=b;m2=c;
    }
  else if (b>c & b>a)
    {
      Max=b;m1=c;m2=a;
    }
  else if (c>a & c>b)
    {
      Max=c;m1=a;m2=b;
    }
  else if (a==b & b==c)
    {
      Max=a;m1=b;m2=c;
    }
  else if (a==b)
    {
      if (a>c)
        {
          Max=a;m1=b;m2=c;
        }
      else
        {
          Max=c;m1=a;m2=b;
        }
    }
  else if(b==c)
    if (a>b)
      {
        Max=a;m1=b;m2=c;
      }
    else
      {
        Max=c;m1=a;m2=b;
      }
  else if(c==a)
    if (a>b)
      {
        Max=a;m1=b;m2=c;
      }
    else
      {
        Max=b;m1=a;m2=b;
      }
  *p=Max;*q=m1;*r=m2;
}

int main(void)
{
  int n,i,p,q,r;
  scanf("%d",&n);
  for(i=0;i!=n;i++)
    {
      scanf("%d %d %d",&p,&q,&r);
      Maxcheck(&p,&q,&r);
      if (p*p==q*q+r*r)
        {
          printf("YES\n");
        }
      else
        {
          printf("NO\n");
        }
    }
  return 0;
}