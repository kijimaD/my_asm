#include <stdio.h>

extern unsigned int rdtsc(void);

int main(void) {
  unsigned int counter = rdtsc();
  printf("%u\n", counter);
  return 0;
}
