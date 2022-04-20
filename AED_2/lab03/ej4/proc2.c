#include <stdlib.h>
#include <stdio.h>

void absolute(int x, int *y) {
    // Completar aqui
    if(x>=0){
        *y = x;
    }else{
        *y = -x;
    }
}

int main(void) {
    // Completar aqui
    int a = -98;
    //int *res = NULL;
    //*res = 0;
    int res = 0;
    absolute(a,&res);
    printf("El valor de res es: %d\n",res);
    //int r = 0;
    return EXIT_SUCCESS;
}
