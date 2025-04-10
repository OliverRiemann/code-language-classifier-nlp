#include <stdio.h>

int main(){
        int a,b,c,i,j,k,x,N;
        int tri[3];
        scanf("%d", &N);
        for(i = 0; i < N; i++){
                scanf("%d %d %d", &tri[0], &tri[1], &tri[2]);
                                if(tri[0] > tri [1]){
                                        x = tri[0];
                                        tri[0] = tri[1];
                                        tri[1] = x;
                                }
                                if(tri[1] > tri[2]){
                                        x = tri[1];
                                        tri[1] = tri[2];
                                        tri[2] = x;
                                }
                                if(tri[0] > tri [1]){
                                        x = tri[0];
                                        tri[0] = tri[1];
                                        tri[1] = x;
                                }
                if(tri[0]*tri[0] + tri[1]*tri[1] == tri[2]*tri[2]){
                        printf("YES\n");
                }else{
                        printf("NO\n");
                }
        }
return 0;
}