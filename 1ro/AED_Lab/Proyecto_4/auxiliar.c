//funciones realizadas anteriormente que ayudan en gran parte del proyecto

const char* boolR(int x){
    if (x == 1){
        return "True";
    };
    return "False";  
};

int ingreseInt(char c) {
  int x;
  printf("Ingresar un valor para %c: ", c);
  scanf("%d", &x);
  return x;
};

void valorInt(int x, char c) {
  printf("El valor de %c es: %d\n", c, x); 
};


//funciones generadas en el ej05 q se repiten en gran parte del proyecto

void pedirArreglo(int a[], int n_max)
{
    int i = 0;
    while (i < n_max)
    {
        a[i] = ingreseInt('x');
        i++;
        printf("\n");
    }
}

void imprimeArreglo(int a[], int n_max)
{
    int i = 0;
    printf("Los valores son: \n");
    while (i < n_max)
    {
        printf("%d, ", a[i]);
        i++;
    }
    printf("\n");
}