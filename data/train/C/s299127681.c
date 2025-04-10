#include <stdio.h>
int main(void)
{
    int N,min,mid,max,l,i,j;
    
    scanf("%d",&N);
    for(i=0;i<N;i++)
    {
        min=0; mid=0; max=0;
        for(j=0;j<3;j++)
        {
            scanf("%d",&l);
            if(j==0)
            {
                min=l;
            }
            else if(j==1)
            {
                if(l<min)
                {
                    max=min; min=l;
                }
                else if(l>=min)
                {
                    max=l;
                }
            }
            else if(j==2)
            {
                if(l<min)
                {
                    mid=min; min=l;
                }
                else if(l>=min && l<max)
                {
                    mid=l;
                }
                else if(l>=max)
                {
                    mid=max; max=l;
                }
            }
        }
        if(min*min+mid*mid==max*max) printf("YES\n");
        else printf("NO\n");
    }
    
    return 0;
}

