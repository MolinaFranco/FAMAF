#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

int ingreseInt()
{
    int x;
    printf("Ingresar un valor: ");
    scanf("%d", &x);
    return x;
};

void pedirArreglo(int a[], int n_max)
{
    int i = 0;
    while (i < n_max)
    {
        a[i] = ingreseInt();
        i++;
    }
}

int cantidad(int array[], int tam, int elem)
{
    int i = 0;
    int res = 0;
    while (i < tam)
    {
        if (array[i] == elem)
        {
            res++;
        }
        i++;
    }
    return res;
}

int main()
{
    int N, elem;
    printf("Ingresar el tamano del arreglo: ");
    scanf("%d", &N);

    assert(N > 0);

    int a[N];
    pedirArreglo(a, N);
    
    printf("Ingresar el valor a comparar: ");
    scanf("%d", &elem);

    int res = cantidad(a, N, elem);
    printf("La cantidad de valores iguales a %d es: %d\n", elem, res);

    return 0;
}
