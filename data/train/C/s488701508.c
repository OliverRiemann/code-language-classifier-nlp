#include<stdio.h>
int main(void){
    int a,i,j,x,y,z,A,A2;
    scanf("%d",&a);
    for(i=0;i<a;i++){
        scanf("%d%d%d",&x,&y,&z);
        if(x<=y&&y<=z){
            A=z*z;
            A2=x*x+y*y;
            if(A==A2){
                printf("YES\n");
            }else printf("NO\n");
        }else if(x<=z&&z<=y){
            A=y*y;
            A2=x*x+z*z;
            if(A==A2){
                printf("YES\n");
            }else printf("NO\n");
        }else if(y<=x&&x<=z){
            A=z*z;
            A2=x*x+y*y;
            if(A==A2){
                printf("YES\n");
            }else printf("NO\n");
        }else if(y<=z&&z<=x){
            A=x*x;
            A2=z*z+y*y;
            if(A==A2){
                printf("YES\n");
            }else printf("NO\n");
        }else if(z<=y&&y<=x){
            A=x*x;
            A2=z*z+y*y;
            if(A==A2){
                printf("YES\n");
            }else printf("NO\n");
        }else if(z<=x&&x<=y){
            A=y*y;
            A2=x*x+z*z;
            if(A==A2){
                printf("YES\n");
            }else printf("NO\n");
        }
    }
return 0;
}