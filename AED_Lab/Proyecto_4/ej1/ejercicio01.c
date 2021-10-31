#include <stdio.h>
#include "../auxiliar.c"
#include <assert.h>

void holaHasta(int n){

    while(n>0){
        printf("hola\n");
        n--;
    };
}


int main(void)
{
    int n;
    n = ingreseInt('n');
    assert(n>0);
    holaHasta(n);
    

    return 0;
}


