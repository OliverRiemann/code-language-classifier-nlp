#include<stdio.h>
#define compile 0
double func_cal_x(double a, double b, double c, double d, double e, double f);
double func_cal_y(double a, double b, double c, double d, double e, double f);
void func_output(double x, double y);
main()
{
	double a = 0, b = 0, c = 0, d = 0, e = 0, f = 0;
	
	while(scanf("%lf %lf %lf %lf %lf %lf", &a, &b, &c, &d, &e, &f) != EOF)
	{
		double x = 0.0, y = 0.0;
		x = func_cal_x(a, b, c, d, e, f);
		y = func_cal_y(a, b, c, d, e, f);
		func_output(x, y);
	}
	return 0;
}
double func_cal_x(double a, double b, double c, double d, double e, double f)
{
	double result = 0.0;
	result = (((b * f) - (c * e)) / ((b * d) - (a * e)));
	if(result == 0)
	{
		result = 0.0;
	}
#if compile == 1
	printf("x result = %lf\n", result);
#endif
	return result;
}
double func_cal_y(double a, double b, double c, double d, double e, double f)
{
	double result = 0.0;
	result = (((c * d) - (a * f)) / ((b * d) - (a * e)));
	if(result == 0)
	{
		result = 0.0;
	}
#if compile == 1
	printf("x result = %lf\n", result);
#endif
	return result;
}
void func_output(double x, double y)
{
	printf("%.3lf %.3lf\n", x, y);
}