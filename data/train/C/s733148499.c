#include <stdio.h>

void FuncQuickSortArray(int sample[], int left, int right);
void FuncSwap(int *x, int *y);
void FuncShowArray(int array[], int head, int tail);

void FuncQuickSortArray(int sample[], int left, int right)
{
  int pivot;
  int i, j;

  pivot = sample[(left + right) / 2];
  i = left;
  j = right;

  while (1) {
    while (sample[i] < pivot)
      i++;
    while (sample[j] > pivot)
      j--;

    if (i >= j)
      break;

    FuncSwap(&sample[i], &sample[j]);
    i++;
    j--;
  }

  if (left < (i - 1))
    FuncQuickSortArray(sample, left, i - 1);
  if ((j + 1) < right)
    FuncQuickSortArray(sample, j + 1, right);
}

void FuncSwap(int *x, int *y)
{
  int temp = *x;
  *x = *y;
  *y = temp;
}

void FuncShowArray(int array[], int head, int tail)
{
  int i;

  for (i = head; i <= tail; i++){
    if (i != tail) {
      printf("%d ", array[i]);
    } else {
      printf("%d\n", array[i]);
    }
  }
}

int main(void)
{
  int height[10];
  int i;

  for (i = 0; i < 10; i++) {
    scanf("%d", &height[i]);
  }

  FuncQuickSortArray(height, 0, 10 - 1);

  for (i = 9; i >= 7; i--) {
    printf("%d\n", height[i]);
  }

  return 0;
}