#include<stdio.h>

int partition(int arr[],int low,int high){

    int mid;

    if(low<high){
        mid=(low+high)/2;
        partition(arr,low,mid);
        partition(arr,mid+1,high);
        mergeSort(arr,low,mid,high);
    }
    return 0;
}

int mergeSort(int arr[],int low,int mid,int high){

    int i,m,k,l,temp[10];

    l=low;
    i=low;
    m=mid+1;

    while((l<=mid)&&(m<=high)){

         if(arr[l]<=arr[m]){
             temp[i]=arr[l];
             l++;
         }
         else{
             temp[i]=arr[m];
             m++;
         }
         i++;
    }

    if(l>mid){
         for(k=m;k<=high;k++){
             temp[i]=arr[k];
             i++;
         }
    }
    else{
         for(k=l;k<=mid;k++){
             temp[i]=arr[k];
             i++;
         }
    }

    for(k=low;k<=high;k++){
         arr[k]=temp[k];
    }
    return 0;
}

int main(){
    int i,str[10];
    for(i=0;i<10;i++) scanf("%d",&str[i]);
    partition(str,0,9);
    for(i=9;i>6;i--) printf("%d\n",str[i]);
    return 0;
}