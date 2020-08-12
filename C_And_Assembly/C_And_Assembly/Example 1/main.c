#include <stdio.h>

extern void assembly_print();

int main()
{
	printf("C function. About to call Assembly\n");
	
	assembly_print();
	
	printf("Back in C\n");

	return 0;
}
