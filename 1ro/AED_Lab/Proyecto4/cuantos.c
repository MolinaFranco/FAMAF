#include <stdio.h>
#include "tools.c"

struct comp_t
{
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int a[], int tam, int elem)
{
    struct comp_t comp;
    int cont = 0;
    int menores = 0;
    int iguales = 0;
    int mayores = 0;

    while (cont < tam)
    {
        if (a[cont] < elem)
        {
            menores++;
        }
        else if (a[cont] == elem)
        {
            iguales++;
        }
        else
        {
            mayores++;
        }
        cont++;
    }

    comp.mayores = mayores;
    comp.iguales = iguales;
    comp.menores = menores;
    return comp;
}


int main(void)
{
int elem = input("cantidad de elementos = ");
    int array[elem];
    pedirArreglo(array, elem);
    imprimeArreglo(array, elem);
    struct comp_t res = cuantos(array, elem, 5);
    
    printf("Mayores que 5: %d \nMenores que 5: %d\nIguales que 5: %d\n", res.mayores, res.menores, res.iguales);
    return 0;
}



