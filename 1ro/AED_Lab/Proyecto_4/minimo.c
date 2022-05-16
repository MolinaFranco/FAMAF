#include <stdio.h>
#include "auxiliar.c"
#include <assert.h>

int minimo(int x, int y){
    int r;
    if (x <= y){
        r = x;
    }
    else{
        r = y;
    }
    return r;
}

int main(void){
    printf ("Minimo \n");
    int x,y;
    x = ingreseInt('x');
    y = ingreseInt('y');
    printf ("El minimo es %d:", minimo(x,y));
    printf ("\n");

    
    return 0;
}