#include <stdio.h>

int m1;
int m2;
int m3;
int m4;
int m5;
int m6;
int m7;
int m8;
int m9;
int m10;

int big=0;
int flag=0;


int main(void){
	
	scanf("%d",&m1);
	scanf("%d",&m2);
	scanf("%d",&m3);
	scanf("%d",&m4);
	scanf("%d",&m5);
	scanf("%d",&m6);
	scanf("%d",&m7);
	scanf("%d",&m8);
	scanf("%d",&m9);
	scanf("%d",&m10);

	for(;;){
		flag=0;
		if (m1<m2){
			big=m2;
			m2=m1;
			m1=big;
			flag=1;
					}
		if (m2<m3){
			big=m3;
			m3=m2;
			m2=big;
			flag=1;
					}
		if (m3<m4){
			big=m4;
			m4=m3;
			m3=big;
			flag=1;
					}
		if (m4<m5){
			big=m5;
			m5=m4;
			m4=big;
			flag=1;
					}
		if (m5<m6){
			big=m6;
			m6=m5;
			m5=big;
			flag=1;
					}
		if (m6<m7){
			big=m7;
			m7=m6;
			m6=big;
			flag=1;
					}
		if (m7<m8){
			big=m8;
			m8=m7;
			m7=big;
			flag=1;
					}
		if (m8<m9){
			big=m9;
			m9=m8;
			m8=big;
			flag=1;
					}
		if (m9<m10){
			big=m10;
			m10=m9;
			m9=big;
			flag=1;
					}

		if (flag==0)
			break;


		
				}

	printf("%d\n",m1);
	printf("%d\n",m2);
	printf("%d\n",m3);


	return 0;
}