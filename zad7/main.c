#include <stdio.h>
#include <inttypes.h>

double mymax(double, const double*, uint32_t);

int main(){
  const double nums[] = { 1. , 5.7 , 9.4 , 14.8 , 7.1 , 8.2 , 10.5 };
  printf("MyMax: %f\n " , mymax(nums[0], nums, 7));

  return 0;
}
