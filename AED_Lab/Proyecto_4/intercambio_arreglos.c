#include <stdio.h>
#include <assert.h>
#include "auxiliar.c"
// incluyo donde realizamos pedirArreglo e imprimirArreglo

void intercambiar(int a[], int tam, int i, int j)
{
    int o1 = a[i];
    int o2 = a[j];
    a[i] = o1;
    a[j] = o2;
}

int main()
{
    int N, i, j;
    printf("Ingresar el tamano del arreglo: ");
    scanf("%d", &N);
    int a[N];

    pedirArreglo(a, N);
    printf("Ingresar la primera posicion: ");
    scanf("%d", &i);
    assert(i >= N);
    printf("Ingresar la segunda posicion: ");
    scanf("%d", &j);
    assert(j >= N);

    intercambiar(a, N, i, j);
    imprimeArreglo(a, N);

    return 0;
}
