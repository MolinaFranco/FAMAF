#include <stdio.h>
#include <assert.h>
#include "../auxiliar.c"

void pedirArreglo(int a[], int n_max)
{
    int i = 0;
    while (i < n_max)
    {
        a[i] = ingreseInt("x");
        i++;
        printf("\n");
    }
}

void imprimeArreglo(int a[], int n_max)
{
    int i = 0;
    printf("Los valores son: \n");
    while (i < n_max)
    {
        printf("%d, ", a[i]);
        i++;
    }
    printf("\n");
}

int main()
{
    int N;
    N = ingreseInt('N');
    int a[N];
    pedirArreglo(a, N);
    imprimeArreglo(a, N);

    return 0;
}
