#include <stdio.h>

int pedirEntero(void){
    int x;
    printf("Ingresar un entero: ");
    scanf("%d", &x);
    return x;
};

int imprimeEntero(int x){
    printf("El valor es: %d\n", x); 

    return 0;
};
