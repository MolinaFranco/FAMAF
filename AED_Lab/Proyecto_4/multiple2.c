#include <stdio.h>
#include "auxiliar.c"

void multiple2(int a, int b, int c)
{
    int x,y,z;
    x = b;
    y = b + a + c;
    z = b + a;
    valorInt(x, 'x');
    valorInt(y, 'y');
    valorInt(z, 'z');
}

int main(void)
{
    int x, y, z;
    x = ingreseInt('x');
    y = ingreseInt('y');
    z = ingreseInt('z');
    multiple2(x, y, z);
    return 0;
}

