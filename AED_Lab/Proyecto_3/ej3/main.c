#include <stdio.h>
#include <assert.h>
#include "../auxiliar.c"

//1.a
int P1(void){   
    int x;
    x = ingreseInt('x');
    x = 5;
    printf("El valor final de x es: %d\n", x);
    printf("\n");

    return 0;
}

//1.b
int P2(void){
    
    int x, y;
    x = ingreseInt('x');
    y = ingreseInt('y');
    x = x + y;
    y = y + y;
    valorInt(x,'x');
    valorInt(y,'y');
    printf("\n");

    return 0;
}

//1.c
int P3(void){
    int x, y;
    x = ingreseInt('x');
    y = ingreseInt('y') ;
    //3b
    assert(x==2 && y==5);
    y = y + y;
    x = x + y;
    valorInt(x,'x');
    valorInt(y,'y');
    printf("\n");

    return 0;
}

int main(void)
{
    P1();
    P2();
    P2();

    return 0;
}