#include <stdio.h>

extern int sum_asm(void);  // 外部関数sum_asmの利用を宣言

int array_size = 10;
int array[10] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

int main(void) {
  int sum = sum_asm();
  printf("sum = %d\n", sum);
  return 0;
}
