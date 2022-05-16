#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#define N 4

typedef struct
{
    int codigo;
    int precio;
    int cantidad;
} producto_t;

producto_t ingreseProducto()
{
    producto_t x;
    printf("Ingresar un valor para el codigo: ");
    scanf("%d", &x.codigo);
    printf("Ingresar un valor para el precio: ");
    scanf("%d", &x.precio);
    printf("Ingresar un valor para la cantidad: ");
    scanf("%d", &x.cantidad);
    printf("\n");

    return x;
};

void pedirArreglo(producto_t a[], int n_max)
{
    int i = 0;
    while (i < n_max)
    {
        a[i] = ingreseProducto();
        i++;
    }
}

bool hay_cantidad(int codigo, int cantidad_requerida, producto_t a[], int tam)
{
    bool resp = false;
    int i = 0;
    while (i < tam)
    {
        if ((a[i].codigo == codigo) && (a[i].cantidad == cantidad_requerida))
        {
            resp = true;
        }
        i++;
    }
    return resp;
}

int main()
{
    producto_t arr[N];

    pedirArreglo(arr, N);

    int cant, cod;
    printf("Ingresar el codigo que desea consultar: ");
    scanf("%d", &cod);
    printf("Ingresar la cantidad que desea consultar: ");
    scanf("%d", &cant);

    if (hay_cantidad(cod, cant, arr, N))
    {
        printf("Si hay en stock!!\n");
    }
    else
    {
        printf("No hay en stock \n");
    }

    return 0;
}
