#include<stdio.h>
#include<string.h>

struct LENGTH
{
	int length1;
	int length2;
	int length3;
};

int main()
{
	struct LENGTH length[1000];
	int count,set,change;

	scanf("%d",&set);

	for(count = 0;count<set;count++)
	{
		scanf("%d %d %d", &length[count].length1, &length[count].length2, &length[count].length3);

		if(length[count].length1<length[count].length3)
		{
			change = length[count].length1;
			length[count].length1 = length[count].length3;
			length[count].length3 = change;
		}
		if(length[count].length1<length[count].length2)
		{
			change = length[count].length1;
			length[count].length1 = length[count].length2;
			length[count].length2 = change;
		}
		if(length[count].length2<length[count].length3)
		{
			change = length[count].length2;
			length[count].length2 = length[count].length3;
			length[count].length3 = change;
		}
	}

	for(count=0;count<set;count++)
	{
		if((length[count].length1 * length[count].length1) == ((length[count].length2 * length[count].length2) + (length[count].length3 * length[count].length3)))
		{
			printf("YES\n");
		}
		else
		{
			printf("NO\n");
		}
	}
	return 0;
}