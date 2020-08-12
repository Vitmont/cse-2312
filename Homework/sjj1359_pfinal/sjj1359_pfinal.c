// Seth Jaksik
// 1001541359
// sjj1359_pfinal.c

#include <stdio.h>

extern unsigned int flipEndian(unsigned int val);
extern unsigned int reverseOrder(unsigned int val);

void printBin(unsigned int num)
{
	unsigned i;
	for(i = 1 << 31; i > 0; i = i/2)
	{
		(num & i)? printf("1") : printf("0");
	}
    printf("\t");
}

int main(int argc, char **argv)
{
    unsigned int array_a[3];
    scanf("%X", &array_a[0]);
    scanf("%X", &array_a[1]);
    scanf("%X", &array_a[2]);
    
    printf("array_a[0]\t=\t");
    printBin(array_a[0]);
    printf("%u\t%X\n", array_a[0], array_a[0]);

    printf("array_a[1]\t=\t");
    printBin(array_a[1]);
    printf("%u\t%X\n", array_a[1], array_a[1]);

    printf("array_a[2]\t=\t");
    printBin(array_a[2]);
    printf("%u\t%X\n", array_a[2], array_a[2]);

    printf("BIT REVERSE ORDER\n");

    array_a[0] = reverseOrder(array_a[0]);
    array_a[1] = reverseOrder(array_a[1]);
    array_a[2] = reverseOrder(array_a[2]);

    printf("array_a[0]\t=\t");
    printBin(array_a[0]);
    printf("%u\t%08X\n", array_a[0], array_a[0]);

    printf("array_a[1]\t=\t");
    printBin(array_a[1]);
    printf("%u\t%08X\n", array_a[1], array_a[1]);

    printf("array_a[2]\t=\t");
    printBin(array_a[2]);
    printf("%u\t%08X\n", array_a[2], array_a[2]);

    array_a[0] = reverseOrder(array_a[0]);
    array_a[1] = reverseOrder(array_a[1]);
    array_a[2] = reverseOrder(array_a[2]);

    printf("Endian Conversion\n");

    array_a[0] = flipEndian(array_a[0]);
    array_a[1] = flipEndian(array_a[1]);
    array_a[2] = flipEndian(array_a[2]);

    printf("array_a[0]\t=\t");
    printBin(array_a[0]);
    printf("%u\t%08X\n", array_a[0], array_a[0]);

    printf("array_a[1]\t=\t");
    printBin(array_a[1]);
    printf("%u\t%08X\n", array_a[1], array_a[1]);

    printf("array_a[2]\t=\t");
    printBin(array_a[2]);
    printf("%u\t%08X\n", array_a[2], array_a[2]);
}
