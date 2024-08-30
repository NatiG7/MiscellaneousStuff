#include <stdio.h>

int main()
{
    // Basic types
    printf("Size of char: %zu byte(s)\n", sizeof(char));
    printf("Size of short: %zu byte(s)\n", sizeof(short));
    printf("Size of int: %zu byte(s)\n", sizeof(int));
    printf("Size of long: %zu byte(s)\n", sizeof(long));
    printf("Size of long long: %zu byte(s)\n", sizeof(long long));
    printf("Size of float: %zu byte(s)\n", sizeof(float));
    printf("Size of double: %zu byte(s)\n", sizeof(double));
    printf("Size of long double: %zu byte(s)\n", sizeof(long double));

    // Variables of basic types
    char c;
    int i;
    float f;

    printf("\nSize of char variable: %zu byte(s)\n", sizeof(c));
    printf("Size of int variable: %zu byte(s)\n", sizeof(i));
    printf("Size of float variable: %zu byte(s)\n", sizeof(f));

    // Pointers
    char *pChar;
    int *pInt;
    float *pFloat;

    printf("\nSize of char pointer: %zu byte(s)\n", sizeof(pChar));
    printf("Size of int pointer: %zu byte(s)\n", sizeof(pInt));
    printf("Size of float pointer: %zu byte(s)\n", sizeof(pFloat));

    return 0;
}