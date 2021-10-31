#include <stdio.h>
#include "../auxiliar.c"

//1.e

int P1(void){
    int x, y;
    x = ingreseInt('x');
    y = ingreseInt('y');
    if(x >= y){
        x = 0;
    }
    else if(x <= y){
        x = 2;
    }
    valorInt(x,'x');
    valorInt(y,'y');
    printf("\n"); 

    return 0;
}

//1.f
int P2(void){
    int x, y;
    x = ingreseInt('x');
    y = ingreseInt('y');
    if(x >= y){
        x = 0;
    }
    else if(x <= y){
        x = 2;
    }
    valorInt(x,'x');
    valorInt(y,'y');
    printf("\n");

    return 0;
}

int main(void)
{
    P1();
    P2();   

    return 0;
}