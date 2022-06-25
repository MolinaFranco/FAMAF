#include <stdbool.h>
#include <stdlib.h>
#include <assert.h>

#include "list.h"

struct s_node_t {
    elem val;
    struct s_node_t *next;
};


list empty(){
    return NULL;
}

list addl(list l, elem e){
    struct s_node_t *n;
    n = malloc(sizeof(struct s_node_t));
    n->val = e;
    n->next = l;
    return n;
}

list addr(list l, elem e){
    struct s_node_t *n;
    n = malloc(sizeof(struct s_node_t));
    n->val = e;
    n->next = NULL;
    if(l != NULL) {
        list i;
        i = l;
        while(i->next != NULL) {
            i = i->next;
        }
        i->next = n;
    } else {
        l = n;
    }
    return l;
}

bool is_empty(list l){
    return (l==NULL);
}

elem list_index(list l, unsigned int i){
    assert(i < length(l));
    list m = l;
    unsigned int c = i;
    while(c<i){
        m = m->next;
        c++;
    }
    return m->val;
}

list copy(list l){
    list lc = empty();
    list p = l;
    while(p!=NULL) {
        addr(lc, p->val);
        p = p->next;
    }
    return lc;
}

list concat(list l1, list l2){
    list lc = copy(l1);
    list p = lc;
    while(p!=NULL) {
        p = p->next;
    }
    p = copy(l2);
    return lc;
}

list tail(list l){
    assert(!is_empty(l));
    return l->next;
}

elem head(list l){
    assert(!is_empty(l));
    return l->val;
}


unsigned int length(list l){
    unsigned int res = 0;
    list p = l;
    while(p != NULL) {
        p = p->next;
        res++;
    }
    return res; 
}

list drop(list l, unsigned int n){
    assert(n<=length(l));
    while(n>0) {
        l = l->next;
        n--;
    }
    return l;
}

list list_destroy(list l){
    if(l != NULL) {
        list a, b;
        a = l;
        b = a->next;
        while(a != NULL) {
            free(a);
            a = b;
            if(a != NULL) {
                b = a->next;
            }
        }
        l = a;
  }
  return l;
}