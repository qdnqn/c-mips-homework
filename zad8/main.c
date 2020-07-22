#include <stdio.h>
#include <inttypes.h>

/*void roundToTick ( double * p , uint32_t precision ) {
uint32_t r = * p * precision;
* p = ( double )r / precision;
}
double getTick ( double num ) {
if (num == 0 )
return 0. ;
if (num < 10 )
return 0.001 ;
if (num < 100 )
return 0.01 ;
if (num < 1000 )
return 0.1 ;
return 1. ;
}
double calculateAmount ( double price , int quantity ) {
roundToTick ( & price, 1 / getTick (price));
return price * quantity;
}*/


double calculateAmount(double price, int quantity);

int main ( int argc , char const * argv [] ) {
	for ( double i = 3.451748 ; i < 4000. ; i *= 10. ) {
		printf ( "Amount( %f , 307) = %f\n " , i, calculateAmount (i, 307 ));
	}
	
	return 0;
}
