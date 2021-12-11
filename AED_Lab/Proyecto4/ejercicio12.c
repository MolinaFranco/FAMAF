#include <stdio.h>
#include "tools.c"

typedef struct _persona
{
    char *nombre;
    int edad;
    float altura;
    float peso;
} persona_t;

float peso_promedio(persona_t arr[], unsigned int longitud)
{

    int sumatoria = 0;
    unsigned int cont = 0;
    // Por el "unsigned int longitud" tengo que usar "(unsigned) cont"
    // *El unsigned "Le indica a la variable que no va a llevar signo"

    while (cont < longitud)
    {
        sumatoria += arr[cont].peso;
        cont++;
    }
    return sumatoria / longitud;
}

persona_t persona_de_mayor_edad(persona_t arr[], unsigned int longitud)
{

    persona_t res;
    int max_edad = 0;
    unsigned int cont = 0;

    while (cont < longitud)
    {
        if (max_edad < arr[cont].edad)
        {
            res = arr[cont];
            max_edad = arr[cont].edad;
        }

        cont++;
    }
    return res;
}

persona_t persona_de_menor_altura(persona_t arr[], unsigned int longitud)
{

    persona_t res;
    int min_altura = 0;
    unsigned int cont = 0;

    while (cont < longitud)
    {
        if (min_altura < arr[cont].altura)
        {
            res = arr[cont];
            min_altura = arr[cont].altura;
        }

        cont++;
    }
    return res;
}

int main(void)
{
    persona_t p1 = {"Paola", 21, 1.85, 75}; // promedio = 74
    persona_t p2 = {"Luis", 54, 1.75, 69};  // mayor edad
    persona_t p3 = {"Julio", 40, 1.70, 80}; // mayor altura
    unsigned int longitud = 3;

    persona_t arr[] = {p1, p2, p3};
    printf("El peso promedio es %f\n", peso_promedio(arr, longitud));

    persona_t p = persona_de_mayor_edad(arr, longitud);
    printf("El nombre de la persona con mayor edad es %s\n", p.nombre);

    p = persona_de_menor_altura(arr, longitud);
    printf("El nombre de la persona con menor altura es %s\n", p.nombre);
    return 0;
}