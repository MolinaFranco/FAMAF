#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include "stack.h"

struct _s_stack {
    stack_elem *elems;      // Arreglo de elementos
    unsigned int size;      // Cantidad de elementos en la pila
    unsigned int capacity;  // Capacidad actual del arreglo elems
};


void control(stack s){
    assert(s->size <= s->capacity);
    if(s->size == s->capacity){
        size_t newcapacity;
        if (s->size == 0){
            newcapacity = 1;
        }else{
            newcapacity = 2*(s->capacity);
        }
        s->elems = realloc(s->elems, newcapacity*sizeof(stack_elem));
        s->capacity = newcapacity;
    }
}


stack stack_empty(){
    stack s = malloc(sizeof(struct _s_stack));
    s->elems = NULL;
    s->size = 0;
    s->capacity = 0;
    return s;
}

stack stack_push(stack s, stack_elem e){
    control(s);
    s->elems[s->size] = e;
    ++(s->size);
    return s;
}


stack stack_pop(stack s){
    assert(s != NULL);
    --(s->size);
    return s;
}



unsigned int stack_size(stack s){
    assert(s != NULL);
    return s->size;
}


stack_elem stack_top(stack s){
    assert(s != NULL);
    assert(s->size >= 1);
    return s->elems[(s->size)-1];
}


bool stack_is_empty(stack s){
    assert(s != NULL);
    return (s->size == 0);
}


stack_elem *stack_to_array(stack s){
    assert(s != NULL);
    stack_elem *arr = calloc(s->size, sizeof(stack_elem));;
    arr = memcpy(arr,s->elems,s->size);
    return arr;
}


stack stack_destroy(stack s){
    if(s != NULL){
        free(s->elems);
        s->elems = NULL;
        free(s);
        s = NULL;
    }
    return s;
}