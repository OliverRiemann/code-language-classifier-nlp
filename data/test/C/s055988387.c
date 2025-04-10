#include <stdio.h>
#include <math.h>
int main(){
    int a,b,r=100,a2,b2,i,cnt=0,s=1;
    long int yaku[1000]={0},bai[1000];
    while(scanf("%d %d",&a,&b)!=EOF){
        a2=a;
        b2=b;
        if(a>b){
            r=a-b;
        }else{
            r=b-a;
        }
        while(r!=0){//ユーグリッドの公約数
            if(a2>b2){
                r=a2-b2;
                a2=b2;
                b2=r;
                s=1;
            }else{
                r=b2-a2;
                b2=a2;
                a2=r;
                s=2;
            }
        }
        if(s==1){
            yaku[cnt]=a2;
        }else{
            yaku[cnt]=b2;
        }
        bai[cnt]=1;
        for(i=100;i>1;i--){
            if(a%i==0&&b%i==0){
                while(1){
                    a=a/i;
                    b=b/i;
                    bai[cnt]*=i;
                    if(a%i!=0||b%i!=0) break;
                }
            }
        }
        
        bai[cnt]*=a*b;
        cnt++;
        r=100;
    }
    for(i=0;i<cnt;i++){
        printf("%ld %ld\n",yaku[i],bai[i]);
    }
    return 0;
}