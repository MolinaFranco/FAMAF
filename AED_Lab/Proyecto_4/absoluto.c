#include <stdio.h>
#include "auxiliar.c"
#include <assert.h>

void valorAbsoluto(int x)
{
    if (x < 0)
    {
        x = -x;
    }
    printf("El valor absoluto es: %g", x);
}



int main(void){
    int v;
    printf ("valorAbsoluto \n");
    v = ingreseInt("v");
    valorAbsoluto(v);
    printf ("\n");
   
    return 0;
}