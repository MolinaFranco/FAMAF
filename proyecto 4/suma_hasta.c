#include <stdio.h>
#include <assert.h>
#include "tools.c"


int suma_hasta(int N) {

    int res = 0;
    int cont = N;
    while (cont>=0) {
        
        res = res + cont;
        cont = cont - 1;
    }
    return res;

}




int main() {

    int x= input("x=");
    assert(x>=0);
    printf("%d\n", suma_hasta(x));
    return 0;
}
