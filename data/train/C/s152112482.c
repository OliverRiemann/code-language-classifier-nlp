#include<stdio.h>


void qsort(int a[],int left,int right);
int partition(int a[],int left,int right);
void exchange(int *num1,int *num2);


int main(){
    int i;
   int size=10;
   int heigh[size];
   
   for(i=0;i<size;i++){
                       scanf("%d",&heigh[i]);
   }
   qsort(heigh,0,size-1);
   
   for(i=0;i<3;i++){
                       printf("%d\n",heigh[i]);
   }         getchar();getchar();
   
   return 0;
} 

void qsort(int a[],int left,int right){
     if(left<right){
                    int q;
                    q=partition(a,left,right);
                    qsort(a,left,q-1);
                    qsort(a,q+1,right);
     }
}

int partition(int a[],int left,int right){
    int x=a[right];
    int index=left-1;
    int i;
    
    for(i=left;i<right;i++){
                           if(a[i]>x)exchange(&a[++index],&a[i]);
    }
    
    exchange(&a[++index],&a[right]);
    
    return index;
}

void exchange(int *num1,int *num2){
     int t;
     t=*num1;
     *num1=*num2;
     *num2=t;
}