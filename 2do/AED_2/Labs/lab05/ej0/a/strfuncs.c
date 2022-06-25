#include <stdlib.h>
#include <stdbool.h>

size_t string_length(const char *str){
    size_t r = 0;
    bool f = true;
    if(str != NULL) {
        while(f) {
            if(str[r] == '\0') {
                f = false;
            } else {
                r++;
            }
        }

    }
    return r;
}
char *string_filter(const char *str, char c){
    size_t length = string_length(str);
    size_t s = 0;
    size_t j = 0;
    char r[length];
    bool f = true;
    
    if(str != NULL) {
        while(f) {
            if(str[s] == '\0') {
                f = false;
            }else if(str[s] == c) {
                s++;
            }else{
                r[j] = str[s];
                j++;
                s++;
            }
        }
    }
    
    char *filtered = malloc(j+1);
    for(unsigned int i=0; i<=length; i++) {
        filtered[i] = r[i];
    }
    return filtered;
}
