#include <stdio.h>
#include "../auxiliar.c"

int main(void)
{
    int x, y, z;
    int b, w;
    x = ingreseInt('x');
    y = ingreseInt('y');
    z = ingreseInt('z');
    printf("ingrese un valor (1 or 0) para b:");
    scanf("%d",&b);
    printf("ingrese un valor (1 or 0) para w:");
    scanf("%d",&w);

    // printear los valores

    printf("x %% 4 == 0 => %s\n", boolR(x % 4 == 0));
    printf("x + y == 0 && y - x == (-1) * z => %s\n", boolR(x + y == 0 && y - x == (-1) * z));
    printf("not b && w => %s\n", boolR(b==0 && w==1));

    return 0;
}