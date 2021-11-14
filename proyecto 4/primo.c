#include <stdio.h>
#include <stdbool.h>
#include "tools.c"

int nesimo_primo(int N)
{

    int cont = 0;
    int cont_primos = 0;
    int res;

    while (cont_primos < N)
    {
        if (primo(cont) == 1)
        {
            cont_primos++;
            res = cont;
        }
        cont++;
    }
    return res;
}

int main()
{
    bool repetir = true;

    while (repetir)
    {
        int n = input("Primo numero: ");

        if (n < 0)
        {
            printf("Ingrese un numero positivo!\n");
        }
        else
        {
            printf("El primo numero %d es: %d\n", n, nesimo_primo(n));
            printf("Primeros primos: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37.\n");
            repetir = false;
        }
    }
    return 0;
}
