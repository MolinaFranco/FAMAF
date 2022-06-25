#include <stdio.h>
#include "tools.c"


void pedirArreglo(int a[], int n_max)
{
    int i = 0;
    while (i < n_max)
    {
        printf("elem_%d = ", i);
        scanf("%d", &a[i]);
        i++;
    }
}

void imprimeArreglo(int a[], int n_max)
{
    int cont;
    cont = 0;
    printf("[%d", a[cont]);
    cont++;
    while (cont < n_max)
    {
        cont++;
        printf(", %d", a[cont]);
    }
    printf("]\n");  
}
int main(void)
{
    int n_max = input("n_max = ");
    int array[n_max];
    pedirArreglo(array, n_max);
    imprimeArreglo(array, n_max);
    return 0;
}