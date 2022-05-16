#include <stdio.h>
#include <stdbool.h>
#include "tools.c"

bool existe_positivo(int a[], int tam)
{

    int cont = 0;
    bool res = false;
    while (cont < tam)
    {

        if (a[cont] >= 0)
        {
            res = true;
        }
        cont++;
    }
    return res;
}

bool todos_positivos(int a[], int tam)
{
    int cont = 0;
    bool res = true;
    while (cont < tam)
    {

        if (a[cont] < 0)
        {
            res = false;
        }
        cont++;
    }
    return res;
}
int main(void)
{
    int elem = input("cantidad de elementos = ");
    int array[elem];
    pedirArreglo(array, elem);
    printf("%d\n", todos_positivos(array, elem));
    return 0;
}