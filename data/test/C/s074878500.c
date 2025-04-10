#include<stdio.h>

typedef struct eq
{
	int a;
	int b;
	int c;
} eq_t;

int main(){
	eq_t eq1, eq2;
	double ans_x, ans_y;
	
	while(scanf("%d %d %d %d %d %d", &eq1.a, &eq1.b, &eq1.c, &eq2.a, &eq2.b, &eq2.c)==6)
	{
		if(eq1.b == 0)
		{
			ans_x = (double)(eq1.c / eq1.a);
			ans_y = (double)(( eq2.c - eq2.a * ans_x ) / eq2.b);
		}
		else if(eq1.a == 0)
		{
			ans_y = (double)(eq1.c / eq1.b);
			ans_x = (double)(( eq2.c - eq2.b * ans_y ) / eq2.a);
		}
		else
		{
			if(eq2.b == 0)
			{
				ans_x = (double)(eq2.c / eq2.a);
				ans_y = (double)(( eq1.c - eq1.a * ans_x ) / eq1.b);
			}
			else if(eq2.a == 0)
			{
				ans_y = (double)(eq2.c / eq2.b);
				ans_x = (double)(( eq1.c - eq1.b * ans_y ) / eq1.a);
			}
			else
			{
				ans_x = (double)( eq1.c * eq2.b - eq1.b * eq2.c );
				ans_x = ans_x / ( eq1.a * eq2.b - eq1.b * eq2.a );
				ans_y = (double)(( eq1.c - eq1.a * ans_x ) / eq1.b);
			}
		}

		ans_x = ans_x + 0.000499999999;
		ans_y = ans_y + 0.000499999999;

		printf("%.3f %.3f\n", ans_x, ans_y);
	}
	
    return 0;
}