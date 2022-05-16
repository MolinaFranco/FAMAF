#include <stdio.h>
#include "auxiliar.c"
#include <assert.h>

void intercambioVariables(int x, int y, int z)
{
    printf("El valor de x es %d:", y);
    printf("El valor de y es %d:", z);
    printf("El valor de z es %d:", x);
}

int main(void)
{
    int x, y, z;
    printf("intercambioVariables \n");
    x = ingreseInt('x');
    y = ingreseInt('y');
    z = ingreseInt('z');
    intercambioVariables(x, y, z);
    printf("\n");

    return 0;
}
