#include <stdio.h>
#include "../auxiliar.c"
#include "../ej6a/entrada.c"

int main(void)
{
    int x, y, z, m;
    x = pedirEntero();     
    y = pedirEntero();     
    z = pedirEntero();     
    m = pedirEntero();        
    if(x < y){
        m = x;
    }
    else if(x >= y){
        m = x;
    }
    printf("Los valores en el punto medio son: \n"); 
    imprimeEntero(x);
    imprimeEntero(y);
    imprimeEntero(z);
    imprimeEntero(m);
    if(m < z){
    }
    else if (m>=z){
        m = z;
    }
    imprimeEntero(x);
    imprimeEntero(y);
    imprimeEntero(z);
    imprimeEntero(m);
    printf("\n");  

    return 0;  
}
    