#include <stdio.h>
#include "../auxiliar.c"
#include <assert.h>

int minimo(int x, int y){
    if (x <= y){
        printf ("El minimo es %d:", x);
    };
    else{
        printf ("El minimo es %d:", y);
    }
}

int main(void){
    printf ("Minimo \n");
    int x,y,z;
    x = ingreseInt('x');
    y = ingreseInt('y');
    minimo(x,y);
    printf ("\n");

    
    return 0;
}