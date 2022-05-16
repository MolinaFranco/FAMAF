#include <stdio.h>

int input(char str[])
{

    int ta;
    printf("%s", str);
    scanf("%d", &ta);
    return ta;
}

void pedirArreglo(int a[], int n_max)
{
    int i = 0;
    while (i < n_max)
    {
        printf("elem_%d = ", i);
        scanf("%d", &a[i]);
        i++;
    }
}

void imprimeArreglo(int a[], int n_max)
{
    int cont;
    cont = 0;
    printf("[%d", a[cont]);
    cont++;
    while (cont < n_max)
    {
        cont++;
        printf(", %d", a[cont]);
    }
    printf("]\n");
}


void pedirArregloFloat(float a[], int n_max)
{
    int i = 0;
    while (i < n_max)
    {
        printf("elem_%d = ", i);
        scanf("%f", &a[i]);
        i++;
    }
}

void imprimeArregloFloat(float a[], int n_max)
{
    int cont;
    cont = 0;
    printf("[%f", a[cont]);
    cont++;
    while (cont < n_max)
    {
        printf(", %f", a[cont]);
        cont++;
    }
    printf("]\n");
}

int primo(int x)
{
    // determina si un numero es primo o no
    int i = 2;
    while ((x%i!=0) && (x>1)){
        i++;
    }
    return (i==x);
}
