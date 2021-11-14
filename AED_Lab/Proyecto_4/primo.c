#include <stdio.h>
#include <assert.h>
#include "auxiliar.c"


//funcion vista en el teorico
int primo(int x)
{
    int i = 2;
    while ((x % i != 0) && (x > 1))
    {
        i++;
    }
    return (i == x);
}

// Primeros primos: 2, 3, 5, 7, ...

int nesimo_primo(int N)
{
    int c = 0, p = 0;
    int res;

    while (p < N)
    {
        if (primo(c) == 1)
        {
            p++;
            res = c;
        }
        c++;
    }
    return res;
}

int main()
{
    int a = 0;

    while (a == 0)
    {
        int n = ingreseInt('N');

        if (n < 0)
        {
            printf("Ingrese un numero positivo!\n");
        }
        else
        {
            printf("El n-esimo primo %d es: %d\n", n, nesimo_primo(n));
            a = 1;
        }
    }
    return 0;
}
