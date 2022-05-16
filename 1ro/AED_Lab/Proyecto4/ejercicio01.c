    #include <stdio.h>
    #include <assert.h>


int holaHasta(int n) {
    
    while (n>=1)
    {
        printf("hola\n");
        n = n-1;
    }
    
    return 0;
}

int main() {

    int cont;
    scanf("%d", &cont);
    assert(cont > 0);
    holaHasta(cont);
    
    return 0;

}

