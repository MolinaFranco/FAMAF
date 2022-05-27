#include <stdlib.h>
#include <assert.h>
#include "stack.h"
 

struct _s_stack{
    stack_elem value;
    struct _s_stack *next;
};

stack stack_empty(){
    return NULL;
}

stack stack_push(stack s, stack_elem e){
    struct _s_stack *p = malloc(sizeof(struct _s_stack));
    p->value = e;
    p->next = s;
    return p;
}
 
stack stack_pop(stack s){
    struct _s_stack *p = s->next;
    free(s);
    return p;
}

unsigned int stack_size(stack s){
    unsigned int c = 0;
    struct _s_stack *p = s;
    while(p!=NULL){
        ++c;
        p = p->next;
    }
    return c;
}

stack_elem stack_top(stack s){
    return s->value;
}

bool stack_is_empty(stack s){
    return s == NULL;
}

stack_elem *stack_to_array(stack s){
    stack_elem *arr = malloc((stack_size(s))*(sizeof(struct _s_stack)));
    struct _s_stack *p = s;
    unsigned int c = stack_size(s);
    while(p!=NULL){
        arr[c-1] = p->value;
        --c;
        p = p->next;
    }
    return arr;
}

stack stack_destroy(stack s){
    struct _s_stack *p;
    while(s!=NULL){
        p = s;
        s = s->next;
        free(p);
    }
    return s;
}

