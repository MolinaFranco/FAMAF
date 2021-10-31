#include <stdio.h>
#include "../auxiliar.c"

int main(void)
{
    int x, y, z, m;
    x = ingreseInt('x');     
    y = ingreseInt('y');     
    z = ingreseInt('z');     
    m = ingreseInt('m');        
    if(x < y){
        m = x;
    }
    else if(x >= y){
        m = x;
    }
    printf("Los valores en el punto medio son: \n"); 
    valorInt(x, 'x');
    valorInt(y, 'y');
    valorInt(z, 'z');
    valorInt(m, 'm');
    if (m>=z){
        m = z;
    }
    valorInt(x, 'x');
    valorInt(y, 'y');
    valorInt(z, 'z');
    valorInt(m, 'm');
    printf("\n");  

    return 0;  
}