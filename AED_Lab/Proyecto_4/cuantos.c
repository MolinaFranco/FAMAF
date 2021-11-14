#include <stdio.h>
#include <assert.h>
#include "auxiliar.c"
// incluyo donde realizamos pedirArreglo e imprimirArreglo

typedef struct
{
    int menores;
    int iguales;
    int mayores;
} comp_t;

comp_t cuantos(int a[], int tam, int elem)
{
    int i = 0;
    comp_t cuant = {0, 0, 0};
    while (i < tam)
    {
        if (a[i] > elem)
        {
            cuant.mayores++;
        }
        if (a[i] < elem)
        {
            cuant.menores++;
        }
        else
        {
            cuant.iguales++;
        }
        i++;
    }
    return cuant;
}

int main(void)
{

    int N, elem;
    printf("Ingresar el tamano del arreglo: ");
    scanf("%d", &N);
    int a[N];
    pedirArreglo(a, N);
    
    printf("Ingresar el valor a comparar: ");
    scanf("%d", &elem);

    comp_t c = cuantos(a, N, elem);
    printf("La cantidad de mayores es: %d, de menores es: %d y de iguales es: %d\n", c.mayores, c.menores, c.iguales);

    return 0;
}
