#include <stdio.h>

int main(void) 
{
  /*
  int mountains[] = { 1819, 2003, 876, 2840, 1723, 1673, 3776, 2848,
		      1592, 922 };
  */

  int mountains[10];
  int scan = 0;
  for ( scan; scan < 10; ++scan ) {
    scanf("%d", &mountains[scan]);
    // Constraints 0 <= height <= 10000
    if ( mountains[scan] < 0 || mountains[scan] > 10000 ) {
      // Number error
      return -1;
    }
  }

  int first = 0;
  int second = 0;
  int third = 0;

  int x = 0;
  for ( x; x < 10; ++x ) {
    if ( mountains[x] > first ) {
      int old_first = first;
      first = mountains[x];
      if ( old_first > second ) {
	int old_second = second;
	second = old_first;
	if ( old_second > third ) {
	  third = old_second;
	}
      }
    } else if ( mountains[x] > second ) {
      int old_second = second;
      second = mountains[x];
      if ( old_second > third ) {
	third = old_second;
      }
    } else if ( mountains[x] > third ) {
      third = mountains[x];
    }
  }

  printf("%d\n", first);
  printf("%d\n", second);
  printf("%d\n", third);

  return 0;
}