#include <stdlib.h>

// calcula la longitud de la cadena apuntada por str
size_t string_length(const char *str);

// que devuelve una nueva cadena en memoria dinámica que se obtiene tomando los
// caracteres de str que son distintos del caracter c
char *string_filter(const char *str, char c);