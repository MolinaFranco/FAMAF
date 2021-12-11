#include <stdio.h>
#include "tools.c"

int sumatoria(int a[], int tam) {

    int cont = 0;
    int res = 0;
    while (cont < tam) {
        res = res + a[cont];
        printf("res = %d\n", res);
        cont ++;
    }
    return res;

}

int main(void)
{
    int elem = input("elementos = ");
    int array[elem];
    pedirArreglo(array, elem);
    printf("%d\n", sumatoria(array,elem));
    return 0;
}


