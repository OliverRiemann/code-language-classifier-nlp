#include<stdio.h>
 
typedef unsigned char U1;
typedef int S4;

#define NUM_MOUNTAINS	(10) 
#define INVALID_DATA	(-1)
#define NUM_OUTPUTS	(3)


S4 main()
{
	S4 s4_t_i;	/* loop counter */
	S4 s4_t_j;	/* loop counter */
	S4 s4_tp_height[NUM_MOUNTAINS];
	U1 u1_t_delimiter;
	S4 s4_t_tmp;	/* temp variable for sort */

	/* Initialize array */
	for(s4_t_i = (S4)0; s4_t_i < (S4)NUM_MOUNTAINS; s4_t_i++)
	{
		s4_tp_height[s4_t_i] = (S4)INVALID_DATA;
	}

	/* Input height of mountains */
	for(s4_t_i = (S4)0; s4_t_i < (S4)NUM_MOUNTAINS; s4_t_i++)
	{
		(void)scanf("%d%c", &s4_tp_height[s4_t_i], &u1_t_delimiter);
	}

	/* Sort height of mountains */
	for(s4_t_i = (S4)0; s4_t_i < (S4)NUM_MOUNTAINS; s4_t_i++)
	{
		for(s4_t_j = (S4)0; s4_t_j < (S4)NUM_MOUNTAINS - (S4)s4_t_i - (S4)1; s4_t_j++)
		{
			if(s4_tp_height[s4_t_j] < s4_tp_height[s4_t_j + 1])
			{
				s4_t_tmp = s4_tp_height[s4_t_j];
				s4_tp_height[s4_t_j] = s4_tp_height[s4_t_j + 1];
				s4_tp_height[s4_t_j + 1] = s4_t_tmp;
			}
		}
	}

	for(s4_t_i = (S4)0; s4_t_i < (S4)NUM_OUTPUTS; s4_t_i++)
	{
		printf("%d\n", s4_tp_height[s4_t_i]);
	}

	return ((S4)0);
}