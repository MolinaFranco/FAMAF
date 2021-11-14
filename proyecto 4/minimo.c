#include <stdio.h>

int main(void) {

    int x, y;
    printf("x = ");
    scanf("%d", &x);
    printf("y = ");
    scanf("%d", &y);

    if (x>y) {
        printf ("x = %d, y = %d, y es el menor de los dos\n", x, y);
    } else if (x<y) {
        printf ("x = %d, y = %d, x es el menor de los dos\n", x, y);
    } else {
        printf ("x = %d, y = %d, las variables son iguales\n", x, y);
    }


    return 0;
}
