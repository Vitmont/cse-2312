#include <stdio.h>

extern int assembly_add(int a, int b);

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
