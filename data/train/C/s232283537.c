#include <stdio.h>

int main(){
    
    int a,b,c,d,e,f,g,h,i,j;
    int n1,n2,n3;
    
    scanf("%d",&a);
    scanf("%d",&b);
    
    if(b > a){
        
        n1 = b;
        n2 = a;
        
    }else{
        
        n1 = a;
        n2 = b;
        
    }
    
    scanf("%d",&c);
    
    if(c > n1){
        
        n2 = n1;
        n1 = c;
        
    }else if(c > n2){
        
        n3 = n2;
        n2 = c;
        
    }else{
        
        n3 = c;
        
    }
    
    scanf("%d",&d);
    
    if(d > n1){
        
        n3 = n2;
        n2 = n1;
        n1 = d;
        
    }else if(d > n2){
        
        n3 = n2;
        n2 = d;
        
    }else if(d > n3){
        
        n3 = d;
        
    }
    
    scanf("%d",&e);
    
    if(e > n1){
        
        n3 = n2;
        n2 = n1;
        n1 = e;
        
    }else if(e > n2){
        
        n3 = n2;
        n2 = e;
        
    }else if(e > n3){
        
        n3 = e;
        
    }
    
    scanf("%d",&f);
    
    if(f > n1){
        
        n3 = n2;
        n2 = n1;
        n1 = f;
           
    }else if(f > n2){
        
        n3 = n2;
        n2 = f;
        
    }else if(f > n3){
        
        n3 = f;
        
    }
    
    scanf("%d",&g);
    
    if(g > n1){
        
        n3 = n2;
        n2 = n1;
        n1 = g;
        
    }else if(g > n2){
        
        n3 = n2;
        n2 = g;
        
    }else if(g > n3){
        
        n3 = g;
        
    }
    
    scanf("%d",&h);
    
 if(h > n1){
        
        n3 = n2;
        n2 = n1;
        n1 = h;
        
    }else if(h > n2){
        
        n3 = n2;
        n2 = h;
        
    }else if(h > n3){
        
        n3 = h;
        
    }


    scanf("%d",&i);
    
     if(i > n1){
        
        n3 = n2;
        n2 = n1;
        n1 = i;
        
    }else if(i > n2){
        
        n3 = n2;
        n2 = i;
        
    }else if(i > n3){
        
        n3 = i;
        
    }
    
    
    scanf("%d",&j);
    
     if(j > n1){
        
        n3 = n2;
        n2 = n1;
        n1 = j;
        
    }else if(j > n2){
        
        n3 = n2;
        n2 = j;
        
    }else if(j > n3){
        
        n3 = j;
        
    }
    
    
    printf("%d\n",n1);
    printf("%d\n",n2);
    printf("%d\n",n3);
    

    return 0;   
}