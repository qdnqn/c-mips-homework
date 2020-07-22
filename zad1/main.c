#include <stdio.h>
#include <string.h>

short foo ( short a , short b );/*{
if (a < 2 ) {
return 0 ;
} else if (b < 3 ) {
return 1 ;
}
if (a < b) {
return a + foo (a - 1 , b - 3 );
} else {
return a - b + foo (a - 2 , b - 1 );
}
}*/

int main ( int argc , char * argv [] ) {
	int i, j;
		for (i = 2 ; i < 6 ; ++ i) {
			for (j = 3 ; j < 7 ; ++ j) {
				printf ( "foo( %d , %d ), %hd\n " , i, j, foo (i, j));
			}
		}
	return 0 ;
}
