#include<stdio.h>
#define N 10000

int* bubbleSort(int* list, int len){
  int i,j,temp;

  for(i=0; i<len; i++){
    for(j=len-1; j>i; j--){
      if(list[j] > list[j-1]){
        temp = list[j];
        list[j] = list[j-1];
        list[j-1] = temp;
      }
    }
  }

  //for(i=0; i<len; i++){                                                                              
  //  printf("%d\n",list[i]);                                                                          
  //}                                                                                                  

  return list;
}

int main(){
  int inputs[N];
  int *result;
  int number=0,i;
  int catchd = 1;
  for(i=0; i<N; i++){
    number = i;
    catchd = scanf("%d",&inputs[i]);
    if(catchd == EOF) break;
  }

  //printf("len is %d",number);                                                                        

  bubbleSort(inputs, number);
  printf("%d\n",inputs[0]);
  printf("%d\n",inputs[1]);
  printf("%d\n",inputs[2]);

  return 0;
}