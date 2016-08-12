#include <stdio.h>

void printArrayValues(int a[], int length);
void quicksort(int a[], int lower, int upper);
int partition(int a[], int lower, int upper);
void swap(int *a, int *b);

int main() {
  int a[] = {33, 6, 11};
  int length = sizeof(a) / sizeof(a[0]);

  printf("input: \n");
  printArrayValues(a, length);
  printf("\n");

  quicksort(a, 0, length - 1);

  printf("result: \n");
  printArrayValues(a, length);
  printf("\n");

  return 1;
}

void printArrayValues(int a[], int length) {
  int i;
  for(i = 0; i < length; i++) {
    printf("%i ", a[i]);
  }
}

void quicksort(int a[], int lower, int upper) {
  if (lower < upper) {
    int pindex = partition(a, lower, upper);

    quicksort(a, lower, pindex - 1);
    quicksort(a, pindex + 1, upper);
  }
}

int partition(int a[], int lower, int upper) {
  int pivot = a[upper];
  int i = lower - 1;

  int j;
  for(j = lower; j <= upper - 1; j++) {
    if(a[j] < pivot) {
      i++;
      swap(&a[j], &a[i]);
    }
  }

  swap(&a[i + 1], &a[upper]);

  return i + 1;
}

void swap(int *a, int *b) {
  int t = *a;
  *a = *b;
  *b = t;
}
