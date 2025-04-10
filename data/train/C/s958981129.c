#include<stdio.h>

int main(){
  double a, b, c, d, e, f;
  double x,y;
  double ABSx, ABSy, tmp;

  while(scanf("%lf %lf %lf %lf %lf %lf",&a, &b, &c, &d, &e, &f) != EOF){
    /*
    if(b != 0.0){
      if(b*d-a*e != 0.0){
	x = (b*f-c*e)/(b*d-a*e);
	y = (c-a*x)/b;
      }
      else{
	//xとyは一意に定まらない？
	return -1;
      }
    }
    //b == 0のとき
    else{
      if(a != 0.0){
	x = c/a;
	if(e != 0.0){
	  y = (f-d*x)/e;
	}
	else{
	  //yは一意に定まらない
	}
      }
      //a == 0のとき
      else{
	//xとyは一意に定まらない
	return -1;
      }
    }
    */
    y = (a*f-c*d)/(a*e-b*d);
    x = (c-b*y)/a;

    if(x > -0.0005 && x < 0) x = 0.0;
    if(y > -0.0005 && y < 0) y = 0.0;

    /*四捨五入
    ABSx = (x < 0)? -x : x;
    tmp = (ABSx - (double)(int)ABSx) * 1000;
    tmp = (double)(int)(tmp + 0.5); tmp = tmp/1000;
    x = (x < 0) ? -(double)(int)ABSx + tmp : (double)(int)ABSx + tmp;  
    ABSy = (y < 0)? -y : y;
    tmp = (ABSy - (double)(int)ABSy) * 1000;
    tmp = (double)(int)(tmp + 0.5); tmp = tmp/1000;
    y = (y < 0) ? -(double)(int)ABSy + tmp : (double)(int)ABSy + tmp;    
    */

    /*output*/
    printf("%.3lf %.3lf\n",x ,y);
  }

  return 0;
}