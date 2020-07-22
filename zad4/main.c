#include <stdio.h>

float bar(float, float, double);

int main(){
  float res = bar(2.2, 4.4, 6.6);

  printf("Result is: %f", res);
  
  return 0;
}
