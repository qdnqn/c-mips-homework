#include <stdio.h>

double baz(float, double*, float, int);

int main(){
	double d = 10.0;
	double res = baz(2.5, &d, 2.5, 1);
	
	printf("Result: %lf\n", res);
	
	return 0;
}
