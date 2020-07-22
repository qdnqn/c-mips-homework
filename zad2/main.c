#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#include <stdlib.h>

//static char * d;

//static void print_comb(uint32_t);
//static void combinations_impl(char, uint32_t, uint32_t, uint32_t);

void combinations ( char * chars , uint32_t size , uint32_t r ); /* {
  d = malloc (r);
  combinations_impl (chars, r, size, r);
}*/

static void combinations_impl ( char * chars , uint32_t maxr , uint32_t size , uint32_t r );/* {
    if (r == 0 ) {
    print_comb (maxr);
    return ;
  }
  
  for ( int i = 0 ; i < size; ++ i) {
    d [maxr - r] = chars [i];
    combinations_impl (chars, maxr, size, r - 1 );
  }
}
static void print_comb ( uint32_t maxr ) {
  for ( int i = 0 ; i < maxr; ++ i) {
    printf ( " %c " , d [i]);
  }

  printf ( " \n " );
}*/

int main ( int argc , char const * argv [] ) {
  char set [] = { 'a' , 'b' };
  combinations(set, 2 , 1);
  return 0 ; 
}


