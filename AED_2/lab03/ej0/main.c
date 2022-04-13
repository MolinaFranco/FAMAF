#include <stdlib.h>
#include <stdio.h>

#define MAX_SIZE 1000

static void dump(char a[], unsigned int length) {
    printf("\"");
    for (unsigned int j=0u; j < length; j++) {
        printf("%c", a[j]);
    }
    printf("\"");
    printf("\n\n");
}

unsigned int data_from_file(const char *path, 
                            unsigned int indexes[], 
                            char letters[], 
                            unsigned int max_size);

                            


int main(const char *filepath) {
        
    FILE *file;
    file = fopen(filepath,"r");
    // arreglo para los valores enteros
    unsigned int indexes[MAX_SIZE];
    // arreglo para los caracteres
    char letters[MAX_SIZE];

    char sorted[MAX_SIZE];
    unsigned int length=0; 
    //  .----------^
    //  :
    // Debe guardarse aqui la cantidad de elementos leidos del archivo
    
    file = fopen("libros.dat", "rt");
    unsigned int moment_index;
    char moment_letter;
    while (!feof(file)) {
        ++length;
        fscanf (file, "%d, %c", &moment_index, &moment_letter);
        printf ("Extraido: %d \n", moment_index);
        printf ("Extraido: %c \n", moment_letter);

    }
    fclose(file);
    puts ("\n Final del documento");

    dump(sorted, length);

    return EXIT_SUCCESS;
}

