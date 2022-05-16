#include <stdio.h>
#include <stdbool.h>
#include "auxiliar.c"
// incluyo donde realizamos pedirArreglo

bool existe_positivo(int a[], int tam)
{
    bool r = false;
    int i = 0;
    while (i < tam)
    {
        if (a[i] >= 0)
        {
            r = true;
            break;
        }
        i++;
    }
    return r;
}

bool todos_positivos(int a[], int tam)
{
    bool r = true;
    int i = 0;
    while (i < tam)
    {
        if (a[i] < 0)
        {
            r = false;
            break;
        }
        i++;
    }
    return r;
}

int main(void)
{
    int N = 4, a[N], fun = 0;
    pedirArreglo(a, N);

    while (fun != 1)
    {
        printf("Seleccionar que funcion quiere ejecutar:\n  1.existe_positivo\n  2.todos_positivos\n 3.salir");
        scanf("%d", &fun);

        if (fun == 1)
        {
            printf("%s\n", existe_positivo(a, N) ? "Existe positivo" : "No existe positivo");
        }

        else if (fun == 2)
        {
            printf("%s\n", todos_positivos(a, N) ? "Todos son positivos" : "No todos son positivos");
        }

        else if (fun == 3)
        {
            fun = 1;
        }
        else
        {
            printf("Opcion no valida. \n");
        }
    }

    return 0;
}
