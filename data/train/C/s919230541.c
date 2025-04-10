#include<stdio.h>
#define compile 0
typedef unsigned long ULONG; //unsigned long をULONGとして別名宣言
ULONG func_euclides(ULONG num1, ULONG num2);
void func_output(ULONG num1, ULONG num2);
main()
{
	ULONG input1 = 0, input2 = 0, gcd = 0, lcm = 0; //gcd:最大公約数 lcm:最小公倍数
	while(scanf("%ld %ld", &input1, &input2) != EOF)
	{
		//func_prime(input1, input2);
		gcd = func_euclides(input1, input2);
		lcm = input1 * (input2 / gcd);
#if compile == 1
		printf("input1 = %ld input2 = %ld\n", input1, input2);
		printf("lcm = %ld\n", lcm);
#endif
		func_output(gcd, lcm);
	}
	return 0;
}
ULONG func_euclides(ULONG num1, ULONG num2)
{
	ULONG quot = 0, sur = 0; //quot:商 sur:余り
	
	quot = num1 / num2;
	sur = num1 % num2;
	if(sur == 0)
	{
#if compile == 1
		printf("GCD = %ld\n", num2);
#endif
		return num2;
	}
	else if(sur != 0)
	{
#if compile == 1
		printf("num1 = %ld num2 = %ld\n", num2, sur);
#endif
		func_euclides(num2, sur);
	}
}
void func_output(ULONG num1, ULONG num2)
{
	printf("%ld %ld\n", num1, num2);
}