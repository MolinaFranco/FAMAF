#include <stdio.h>
#include "tools.c"

void ejercicioA()
{

    int x, y, xaux;
    x = input("x=");
    y = input("y=");

    xaux = x;
    x = x + 1;
    y = xaux + y;

    printf("x=%x, y=%d", x, y);
}
void ejercicioB()
{

    int x, y, z, xaux, yaux;
    x = input("x=");
    y = input("y=");

    xaux = x;
    yaux = y;
    x = y;
    y = y + xaux + z;
    z = yaux + xaux;

    printf("x=%x, y=%d, z=%d", x, y, z);
}

int main() {

    printf("Ejercicio A");
    ejercicioA();
    printf("Ejercicio B");
    ejercicioB();

    return 0;
}
