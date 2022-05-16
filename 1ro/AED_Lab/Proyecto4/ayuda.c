#include <stdio.h>

int primo(int x)
{
    // determina si un numero es primo o no
    int i = 2;
    while ((x%i!=0) && (x>1)){
        i++;
    }
    return (i==x);
}

int main(void) {
	int x;
	printf("Ingrese un valor para x\n"); 
	scanf("%d", &x); 
    printf("El resultado es %d\n", primo(x)); 
    return 0;
}
