#include <stdio.h>
#include "tools.c"

struct datos_t
{
    float maximo;
    float minimo;
    float promedio;
};

struct datos_t stats(float a[], int tam)
{
    struct datos_t res;
    int cont = 1;
    float sumatoria = a[0];
    float max = a[0];
    float min = a[0];

    while (cont < tam)
    {

        if (a[cont] > max)
        {
            max = a[cont];
        }
        else if (a[cont] < min)
        {
            min = a[cont];
        }

        sumatoria += a[cont];
        cont++;
    }
    res.maximo = max;
    res.minimo = min;
    res.promedio = sumatoria / tam;
    return res;
}

int main(void)
{
    int elem = input("cantidad de elementos = ");
    float array[elem];
    pedirArregloFloat(array, elem);
    imprimeArregloFloat(array, elem);

    struct datos_t data = stats(array, elem);

    printf("max: %f, min: %f, promedio: %f\n", data.maximo, data.minimo, data.promedio);

    return 0;
}
