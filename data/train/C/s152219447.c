#include<stdio.h>

#define HEN_KAZU 3

int main(void)
{

        int i = 0, j = 0, k = 0;
        int n = 0, memo = 0;
        unsigned int hen[HEN_KAZU] = {0, 0, 0};

        scanf("%d",&n);
        for(k = 0; k < n; k++)
        {
                scanf("%d %d %d", &hen[0], &hen[1], &hen[2]);
                for(i = 0; i < HEN_KAZU; i++)
                {
                        for(j = i + 1; j < HEN_KAZU ;j++ )
                        {
                                if(hen[i] > hen[j])
                                {
                                        memo =  hen[i];
                                        hen[i] = hen[j];
                                        hen[j] = memo;
                                }
                        }
                }
                if(hen[2]*hen[2] == (hen[1] * hen[1]) + (hen[0] * hen[0]))
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