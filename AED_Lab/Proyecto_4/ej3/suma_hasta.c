#include <stdio.h>
#include <assert.h>
#include "../auxiliar.c"

int suma_hasta(int n)
{
    int s = 0;
    for (int i = 1; i <= n; i++)
    {
        s += i;
    }
    return s;
}

int suma_hasta_gauss(int n)
{
    int s;
    s= n * (n + 1) / 2;
    return s;
}

int main(void)
{
    int x ;
    x = ingreseInt('x');
    assert(x>=0);
    printf("El valor de su suma: %d\n", suma_hasta(x));
    printf("El valor de su suma por Gauss: %d\n", suma_hasta_gauss(x));
}