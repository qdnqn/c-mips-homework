#include <stdio.h>

int foo(double d1, float f1, float f2);

int main(){
  int res = foo(1.25, 10.25, 20.25);
  printf("Result: %d\n", res);
  return 0;
}
