#include <stdio.h>
#include <assert.h>
#include "../auxiliar.c"
#include "../ej5/ejercicio05.c"

// incluyo el ej5 donde realizamos pedirArreglo

int sumatoria(int a[], int tam){
    int s = 0;
    int i = 0;
    while (i < tam)
    {
        s = s + a[i];
        i++;
    }
    return s;
}

int main()
{
    int N = 4;
    int a[N], s;
    pedirArreglo(a, N);
    s = sumatoria(a, N);
    printf("El valor de la sumatoria es de: %d", s);

    return 0;
}
