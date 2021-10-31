#include <stdio.h>
#include "../auxiliar.c"

int main(void)
{
    int x,y,i;
    x =  ingreseInt('x');
    y =  ingreseInt('y');
    i =  ingreseInt('i');
    i = 0;
    while(x>=y){
        x = x - y;
    	i = i + 1;
        valorInt(x,'x');
        valorInt(y,'y');
        valorInt(i,'i');
        printf("\n");  
    };

    return 0;
}