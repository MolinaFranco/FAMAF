#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"

static unsigned int min_pos_from(int a[], unsigned int i, unsigned int length) {
    unsigned int min_pos = i;
    for (unsigned int j = i + 1; j < length; ++j) {
        if (!goes_before(a[min_pos],a[j])) {
            min_pos = j;
        }
    }
    return (min_pos);
}

bool goes_after(int x, int y){
    bool r = true;
    if (x < y){
        r = false;
    }
    return r;
}

static unsigned int max_pos_from(int a[], unsigned int i, unsigned int length) {
    unsigned int max_pos = i;
    for (unsigned int j = i + 1; j < length; ++j) {
        if (!goes_after(a[maz_pos],a[j])) {
            maz_pos = j;
        }
    }
    return (min_pos);
}

void selection_sort(int a[], unsigned int length) {
    for (unsigned int i = 0u; i < length; ++i) {
        unsigned int min_pos = min_pos_from(a, i, length);
        swap(a, i, min_pos);
    }
}

// selection sort recibe un array y su largo
// recorre todo el array con el for
// busca el menor entre i y el length
// swapea el menor con la posicion en la que esta i (si el menor es i se swapea con si mismo) 


static void insert(int a[], unsigned int i) {
    int j;
    j = i;
    while(j>0 && goes_before(a[j],a[j-1])){
        swap(a,j-1,j);
        --j;
    }
}

void insertion_sort(int a[], unsigned int length) {
    for (unsigned int i = 1u; i < length; ++i) {
        insert(a, i);
    }
}

// insert sort recorre todo el arreglo y llama a insert con el arreglo y la posicion en la que se encuentra
// luego insert arranca en ese i como j y va disminuyendo de a uno hasta 0
// si es el numero anterior cumple con goes before, los swapea

static unsigned int partition(int a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv = izq;
    unsigned int i= izq+1;
    unsigned int j= der;
    
    while(i<=j){
        if(goes_before(a[ppiv],a[i]) && goes_before(a[j],a[ppiv])){
            swap(a,i,j);
            ++i;
            --j;
        }else{
            if(goes_before(a[i],a[ppiv])){
                ++i;
            }
            if(goes_before(a[ppiv],a[j])){
                --j;
            }
        }
    }
    // dejando el pivot en una posición más central
    swap(a,ppiv,j);
    // señalando la nueva posición del pivot
    // ppiv=j;
    return j;
}

// partition recive el array y la opcion de izq y der
// toma la izquierda como pivot y i izq+1 y j der
// si j<ppiv<i  swapean j e i
// si i<ppiv  ++i
// si ppiv<j  --j
// al final cuando j e i son igual devuelve ese numero


static void quick_sort_rec(int a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv = partition(a,izq,der);
    if(ppiv>izq) {
        quick_sort_rec(a, izq, ppiv-1);
    }
    if(ppiv<der) {
        quick_sort_rec(a, ppiv+1, der);
    }
}

// busca el punto pivot que sepamos que todo a su izquierda es menor y todo a su derecha es mayor
// y llamamos a la misma funcion dos veces
// la primera desde izq hasta piv-1 para acomodar la parte de la izq
// la segunda desde piv+1 hasta der para acomodar la parte de la derecha

// si piv ya esta en una de las dos esquinas no llama nada

void quick_sort(int a[], unsigned int length) {
    quick_sort_rec(a, 0u, (length == 0u) ? 0u : length - 1u);
}

// llama a quick sort con el array, izq = 0, der = length-1 o 0 si es length = 0   
