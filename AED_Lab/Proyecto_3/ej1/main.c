#include <stdio.h>
#include "../auxiliar.c"

int main(void)
{
    int x, y, z;
    x = ingreseInt('x');
    y = ingreseInt('y');
    z = ingreseInt('z');

    // printear los valores

    printf("x + y + 1 = %d\n", x+y+1);
    printf("z * z + y * 45 - 15 * x = %d\n", z*z+y*45-15*x);
    printf("y - 2 == (x * 3 + 1) %% 5 => %s\n", boolR(y-2==(x*3+1)%5));
    printf("y / 2 * x = %d\n", y/2*x);
    printf("y < x *z = %d\n", y<x*z);

    return 0;
}

