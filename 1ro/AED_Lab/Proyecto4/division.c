#include <stdio.h>
#include <assert.h>
#include "tools.c"

struct div_t {
    int cociente;
    int resto;
};

struct div_t division(int x, int y) {

    struct div_t div;
    int cociente, resto;

    cociente = x/y;
    resto = x%y;

    div.cociente = cociente;
    div.resto = resto;
    return div;

}



int main() {
    
    struct div_t res;
    int x = input("x = ");
    int y = input("y = ");
    assert(y!=0);
    res = division(x,y);
    printf("*(x/y)*\ncociente = %d\nresto = %d\n", res.cociente, res.resto);

    return 0;
}
