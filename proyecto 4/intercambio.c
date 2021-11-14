#include <stdio.h>
#include "tools.c"

int main() {
    
    int x, y, z;
    x = input("x=");
    y = input("y=");

    z=x;
    x=y;
    y=z;

    printf("x=%d, y=%d\n", x, y);

    return 0;
}

