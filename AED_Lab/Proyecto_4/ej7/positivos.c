#include <stdio.h>
#include "../auxiliar.c"

void multiple1(int x, int y){  
    y = x + y;
    x = x + 1;
    valorInt(x,'x');
    valorInt(y,'y');
}

int main(void)
{
    int x,y,z;
    x = ingreseInt('x');
    y = ingreseInt('y');
    multiple1(x,y);

    return 0;
}

