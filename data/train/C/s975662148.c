#include <stdio.h>
int main(){
    int i,m,m1,m2,m3;
    for(i=0;i<10;i++){
        scanf("%d",&m);
        if(i==0){
            m1=m;
        }
        else if(i==1){
            if(m>m1){
                m2=m1;
                m1=m;
            }
            else{
                m2=m;
            }
        }
        else if(i==2){
            if(m>m2){
                if(m>m1){
                    m3=m2;
                    m2=m1;
                    m1=m;
                }
                else{
                    m3=m2;
                    m2=m;
                }
            }
            else{
                m3=m;
            }
        }
        else{
            if(m>m3){
                if(m>m2){
                    if(m>m1){
                        m3=m2;
                        m2=m1;
                        m1=m;
                    }
                    else{
                        m3=m2;
                        m2=m;
                    }
                }
                else{
                    m3=m;
                }
            }
        }
    }
    printf("%d\n%d\n%d\n",m1,m2,m3);
    return 0;
}