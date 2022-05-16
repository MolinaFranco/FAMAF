#include <stdio.h>
#include <stdbool.h>

int ingreseInt(char c)
{
    int x;
    printf("Ingresar un valor para %c: ", c);
    scanf("%d", &x);
    return x;
};

typedef struct
{
    int primero;
    int segundo;
} organizar_t;

organizar_t organizar(bool b, int x, int y)
{
    organizar_t res;
    if (b)
    {
        res.primero = x;
        res.segundo = y;
    }
    else
    {
        res.primero = y;
        res.segundo = x;
    }
    return res;
}

int main()
{
    int x, y, tmp;
    bool b;
    x = ingreseInt('x');
    y = ingreseInt('y');

    printf("Ingresar un valor para b (1=true, 0=false): ");
    scanf("%d", &tmp);
    b = tmp;

    organizar_t result = organizar(b, x, y);

    printf("El primer valor es: %d y el segundo valor es: %d \n", result.primero, result.segundo);

    return 0;
}
