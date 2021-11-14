#include <stdio.h>
#include <assert.h>
#include "auxiliar.c"

void pedirArreglo2(float a[], int n_max)
{
    int i = 0;
    while (i < n_max)
    {
        a[i] = ingreseInt('x');
        i++;
        printf("\n");
    }
}

typedef struct
{
    float maximo;
    float minimo;
    float promedio;
} datos_t;

datos_t stats(float a[], int tam)
{
    int i = 0, sum = 0;
    datos_t res={a[0],a[0],0};
    while (i < tam)
    {
        if (a[i] > res.maximo)
        {
            res.maximo = a[i];
        }
        if (a[i] < res.minimo)
        {
            res.minimo = a[i];
        }
        sum += a[i];
        i++;
    }
    res.promedio = sum / tam;
    
    return res;
}

int main(void)
{

    int N;
    printf("Ingresar el tamano del arreglo: ");
    scanf("%d", &N);
    float a[N];
    pedirArreglo2(a, N);

    datos_t res = stats(a, N);
    printf("El maximo valor es: %f, el minimo es: %f y el promedio es: %f\n", res.maximo, res.minimo, res.promedio);

    return 0;
}