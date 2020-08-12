#include <stdio.h>

int assembly_add(int a, int b)
{
	int res = 0;
	
	asm("ADD %[result], %[input_a], %[input_b]"
		: [result] "=r" (res)
		:[input_a] "r" (a), [input_b] "r" (b)
		);
		
	return res;
}

int main()
{
	int x = 0;
	int y = 0;
	
	printf("input 2 numbers\n");
	scanf("%d", &x);
	scanf("%d", &y);
	
	int z = assembly_add(x, y);
	
	printf("the sum of these two numbers is %d \n", z); 

	return 0;
}
