#include <stdlib.h>
#include <stdio.h>

#define MAX_SIZE 1000

static void dump(char a[], unsigned int length) {
    printf("\"");
    for (unsigned int j=0u; j<=length; j++) {
        printf("%c", a[j]);
    }
    printf("\"");
    printf("\n\n");
}

char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;

    if (argc < 2) {
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return result;
}

unsigned int data_from_file(const char *path, 
                            unsigned int indexes[], 
                            char letters[], 
                            unsigned int max_size){
    
    FILE *file = fopen(path,"r");
    unsigned int length = 0;

    while (!feof(file) && length<=max_size) {
        fscanf(file, "%u '%c'\n", &indexes[length], &letters[length]);
        ++length;
    }

    fclose(file);
    return length;                            
}

void sort_letters(unsigned int indexes[], 
                            char letters[], 
                            unsigned int length, 
                            char sorted[]){

    for (unsigned int i=0; i<length; ++i)
    {
        sorted[indexes[i]] = letters[i];
    }
    
    // this sort only the letters, for the moment the indexes dont matter
}

int main(int argc, char *argv[]) {
        
    // arreglo para los valores enteros
    unsigned int indexes[MAX_SIZE];
    // arreglo para los caracteres
    char letters[MAX_SIZE];

    char sorted[MAX_SIZE];

    // Debe guardarse aqui la cantidad de elementos leidos del archivo
    unsigned int length=0; 
    char *filepath = parse_filepath(argc, argv);

    length = data_from_file(filepath,indexes,letters,MAX_SIZE);
    sort_letters(indexes,letters,length,sorted);
    
    dump(sorted, length);

    return EXIT_SUCCESS;
}

