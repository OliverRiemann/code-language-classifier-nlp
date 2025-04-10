#include <stdio.h>
#include <math.h>

double round_d(double x) {
    if ( x >= 0.0 ) {
        return floor(x + 0.5);
    } else {
        return -1.0 * floor(fabs(x) + 0.5);
    }
}

int main(){
double num1[10000],num2[10000],num3[10000],num4[10000],num5[10000],num6[10000],x=0.0,y=0.0;
int i,count=0;
for(i=0;i<10000;i++){
if(scanf("%lf %lf %lf %lf %lf %lf",&num1[i],&num2[i],&num3[i],&num4[i],&num5[i],&num6[i])==EOF)break;
count++;
}
for(i=0;i<count;i++){
if((num1[i]==0.0&&num4[i]==0.0)==1||(num2[i]==0.0&&num5[i]==0.0)==1||(num1[i]==0.0&&num2[i]==0.0)==1||(num4[i]==0.0&&num5[i]==0.0)==1||(num2[i]*num4[i]-num1[i]*num5[i])==0.0){}
else{
if(num1[i]==0.0){y=num3[i]/num2[i];x=num6[i]/num4[i]-num3[i]*num5[i]/(num2[i]*num4[i]);}
else if(num2[i]==0.0){x=num3[i]/num1[i];y=num6[i]/num5[i]-num3[i]*num4[i]/(num1[i]*num5[i]);}
else if(num4[i]==0.0){y=num6[i]/num5[i];x=num3[i]/num1[i]-num2[i]*num6[i]/(num1[i]*num5[i]);}
else if(num5[i]==0.0){x=num6[i]/num4[i];y=num3[i]/num2[i]-num1[i]*num6[i]/(num2[i]*num4[i]);}
else{
x=(num2[i]*num6[i]-num3[i]*num5[i])/(num2[i]*num4[i]-num1[i]*num5[i]);
x=round_d(x*1000.0)/1000.0;
y=(num1[i]*num6[i]-num3[i]*num4[i])/(num1[i]*num5[i]-num2[i]*num4[i]);
y=round_d(y*1000.0)/1000.0;
}
printf("%.3f %.3f\n",x,y);
}
}
return 0;
}