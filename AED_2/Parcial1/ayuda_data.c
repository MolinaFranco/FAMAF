unsigned int data_from_file(const char *path, 
                            unsigned int indexes[], 
                            char letters[], 
                            unsigned int max_size){
    
    FILE *file = fopen(path,"r");
    // abre el archivo en en el .c
    unsigned int length = 0;
    // declaro largo 0 por q quiero ir contando la cantidad de letras
    while (!feof(file) && length<=max_size) {
        fscanf(file, "%u '%c'\n", &indexes[length], &letters[length]);
        ++length;
    }
    // con el while (!feof(file)) determinamos que lea hasta que no haya nada mas adelnate
    // ademas ponemos un maximo length por las dudas

    // con el fscan voy leyendo lo que esta dentro y guardandolo en los arrays
    // %u para unsigned int
    // %c char
    // %s string
    fclose(file);
    return length;                            
}

// recibe un path basicamente el archivo
// un arreglo indexes donde va a ir guardando los numeros
// un arreglo letters donde va a ir guardando las letras
// y max size que es el maximo que va a leer, esto lo podemos cambiar despues

int *p;
// p es un puntero * que apunta a un int
int a = 100;
p = &a;
// el puntero p es igual o apunta al casillero & donde se guarda a