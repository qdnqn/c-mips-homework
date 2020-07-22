#include <stdio.h>
#include <inttypes.h>

float Q_sqrt(float);

int main(){
  float res = Q_sqrt(3.3);
  
  printf("Square root is: %f", res);

  return 0;
}
