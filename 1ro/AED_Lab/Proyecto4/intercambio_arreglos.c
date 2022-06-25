#include <stdio.h>
#include <assert.h>
#include "tools.c"

void intercambiar(int a[], int tam, int i, int j)
{
    assert(i < tam && j < tam);
    int iaux, jaux;
    iaux = a[i];
    jaux = a[j];
    a[i] = jaux;
    a[j] = iaux;
}

int main(void)
{
int elem = input("cantidad de elementos = ");
    int array[elem];
    pedirArreglo(array, elem);
    imprimeArreglo(array, elem);
    intercambiar(array, elem, 0, 1);
    imprimeArreglo(array, elem);
    return 0;
}


