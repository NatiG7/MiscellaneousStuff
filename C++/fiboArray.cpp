#include <stdio.h>

int main()
{
    int fibonacci[10]; // Array to hold the first 10 Fibonacci numbers
    int i;

    // Initialize the first two Fibonacci numbers
    fibonacci[0] = 1;
    fibonacci[1] = 1;

    // Calculate the rest of the Fibonacci numbers
    for (i = 2; i < 10; i++)
    {
        fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2];
    }

    // Print the first 10 Fibonacci numbers
    for (i = 0; i < 10; i++)
    {
        printf("%d\n", fibonacci[i]);
    }

    // Print odd-positioned Fibonacci numbers (1st, 3rd, 5th, 7th, 9th)
    for (i = 0; i < 10; i += 2)
    {
        printf("%d\n", fibonacci[i]);
    }

    // Print even-positioned Fibonacci numbers (2nd, 4th, 6th, 8th, 10th)
    for (i = 1; i < 10; i += 2)
    {
        printf("%d\n", fibonacci[i]);
    }

    return 0;
}