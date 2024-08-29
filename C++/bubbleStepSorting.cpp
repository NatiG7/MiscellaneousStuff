#include <stdio.h>

void printArray(float arr[], int size)
{
    for (int i = 0; i < size; i++)
    {
        printf("%.2f ", arr[i]);
    }
    printf("\n");
}

int main()
{
    float numbers[10] = {5.6, 4.3, 6.2, 6.4, 7.3, 2.3, 8.3, 9.2, 0.1, 1.9};
    int i, j, swapped;
    float aux;

    // Print initial array
    printArray(numbers, 10);

    do
    {
        swapped = 0;
        for (i = 0; i < 9; i++)
        {                                    // Loop until second to last element
            if (numbers[i] > numbers[i + 1]) // Ascending order
            {
                swapped = 1;
                aux = numbers[i];
                numbers[i] = numbers[i + 1];
                numbers[i + 1] = aux;
            }
        }
        // Print array after each outer loop iteration
        printArray(numbers, 10);
    } while (swapped);

    return 0;
}