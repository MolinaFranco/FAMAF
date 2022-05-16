#include <stdio.h>


int main() {
    int x;
    printf("x = ");
    scanf("%d", &x);
    if (x<0) {
        x = -x;
    }
    printf("valor absoluto de x =%d\n", x);

    return 0;
}
