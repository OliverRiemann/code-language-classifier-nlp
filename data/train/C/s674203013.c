#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double cal_Pow(int side){
    double cal;
    cal = pow(side,2);
    return cal;
}

int main(int argc, const char * argv[]){
    int i;
    int data_set;
    int side_a,side_b,side_c;
    scanf("%d",&data_set);
    if(data_set > 1000)
        exit(0);
    
    for(i = 0; i < data_set; i++){
        scanf("%d %d %d",&side_a,&side_b,&side_c);
        if((1 > side_a && side_a > 1000) && (1 > side_b && side_b > 1000) && (1 > side_c && side_c > 1000)){
            exit(0);
        }
        
        if((cal_Pow(side_a) + cal_Pow(side_b) == cal_Pow(side_c)) ||
           (cal_Pow(side_a) + cal_Pow(side_c) == cal_Pow(side_b)) ||
           (cal_Pow(side_b) + cal_Pow(side_c) == cal_Pow(side_a))){
            printf("YES\n");
        }else{
            printf("NO\n");
        }
           
//        if(side_a != side_b){
//            if(side_a != side_c){
//                if(side_b != side_c){
//                    printf("NO");
//                }
//            }
//        }
//        if(side_a == side_b){
//            if(side_a != side_c){
//                printf("YES");
//            }else{
//                printf("NO");
//            }
//        }
//        if(side_a == side_c){
//            if(side_a != side_b){
//                printf("YES");
//            }else{
//                printf("NO");
//            }
//        }
//        if(side_b == side_c){
//            if(side_b != side_a){
//                printf("YES");
//            }else{
//                printf("NO");
//            }
//        }
    }
    return 0;
}