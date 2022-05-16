#include <stdio.h>
#include <assert.h>
#include "auxiliar.c"

typedef struct
{
    int cociente;
    int resto;
} div_t;

div_t division(int x, int y)
{
    div_t d = {x / y, x % y};
    return d;
}

int main(void)
{
    int x = ingreseInt('x');
    int y = ingreseInt('y');
    assert(y!=0);
    div_t d = division(x, y);
    printf("El cociente es: %d, y el resto es: %d\n", d.cociente, d.resto);
}

