#include <stdbool.h>

#include "pivot.h"

bool is_pivot(int array[], unsigned int length, unsigned int piv) {
    // -- Completar --

    // un arreglo array
    // su longitud length 
    // un índice piv 
    
    assert(0 <= piv < length);

    bool r = true;

    for(unsigned int j=0; j<piv; ++j){
        if(array[j] > array[piv]){
            r = false;
        }
    }
    for(unsigned int k=(piv+1); k<=length; ++k){
        if(array[piv] >= array[k]){
            r = false;
        }
    }

    // El valor de retorno de la función es true si y sólo si para
    // todo j < piv se tiene array[j] ≤ array[piv], y para todo k > piv se
    // tiene array[piv] < array[k].
    
    return r;
}
