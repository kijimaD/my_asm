// $ gcc -fno-pic inline.c -o inline -no-pie
// $ ./inline

#include <stdio.h>

int main(void) {
  int i = 123;
  asm("addl $456,%0" : "=r" (i) : "0" (i));
  printf("i = %d\n", i);
  return 0;
}
