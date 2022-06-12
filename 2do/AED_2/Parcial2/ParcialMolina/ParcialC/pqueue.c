#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include "pqueue.h"

struct s_pqueue {
    struct s_node * * array;
    unsigned int length;
    priority_t min_priority;
};

struct s_node {
    pqueue_elem elem;
    struct s_node *next;
};

static struct s_node * create_node(pqueue_elem e) {
    struct s_node* new_node=NULL;
    
    new_node = malloc(sizeof(struct s_node));
    assert(new_node!=NULL);
    new_node->elem = e;
    new_node->next = NULL;

    return new_node;
}

static struct s_node * destroy_node(struct s_node *node) {
    
    assert(node != NULL);
    free(node);
    node = NULL;
    assert(node == NULL);

    return node;
}


static bool invrep(pqueue q) {

    bool inv = (q!=NULL);
    if(inv){
        inv = inv && (q->array != NULL); 
    }

    return inv;
}

pqueue pqueue_empty(priority_t min_priority) {
    
    pqueue q = malloc(sizeof(struct s_pqueue));
    assert(q!=NULL);
    q->array = malloc((min_priority+1) * sizeof(struct s_node *));
    
    q->length = 0;
    q->min_priority = min_priority;

    assert(invrep(q) && pqueue_is_empty(q));
    return q;
}

pqueue pqueue_enqueue(pqueue q, pqueue_elem e, priority_t priority) {
    assert(invrep(q) && (priority <= q->min_priority));
    
    struct s_node *new_node = create_node(e);
    
    struct s_node *p = q->array[priority];

    if(p == NULL){
        q->array[priority] = new_node;
    }else{
        while (p->next!=NULL){
            p = p->next;
        }
        p->next = new_node;
    }
    ++q->length;

    assert(invrep(q) && !pqueue_is_empty(q));
    return q;
}

bool pqueue_is_empty(pqueue q) {
    assert(invrep(q));
    bool emp = true;
    for(priority_t i = 0; i <= q->min_priority && emp; i++){
        emp = emp && (q->array[i] == NULL);
    }
    

    return emp; 
}

pqueue_elem pqueue_peek(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));
    
    pqueue_elem ret;
    bool peek = false; 

    for (priority_t i = 0; i <= q->min_priority && !peek; i++){
        if(q->array[i] != NULL){
            ret = q->array[i]->elem;
            peek = true;
        }
    }

    
    return ret; 
}

priority_t pqueue_peek_priority(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));
    
    priority_t ret;
    bool peek = false;

    for (priority_t i = 0; i <= q->min_priority && !peek; i++){
        if(q->array[i] != NULL){
            ret = i;
            peek = true;
        }
    }

    return ret;
}

size_t pqueue_size(pqueue q) {
    assert(invrep(q));
    return q->length;
}

pqueue pqueue_dequeue(pqueue q) {
    assert(invrep(q) && !pqueue_is_empty(q));
    
    bool elim = false;
    
    for (priority_t i = 0; i <= q->min_priority && !elim; i++){
        if(q->array[i] != NULL){
            struct s_node *p;
            p = q->array[i];
            q->array[i] = q->array[i]->next;
            p = destroy_node(p);
            
            elim = true;
        }
    }
    
    --q->length;

    assert(invrep(q));
    return q;
}

pqueue pqueue_destroy(pqueue q) {
    assert(invrep(q));
    
    while(!pqueue_is_empty(q)){
        pqueue_dequeue(q);
    }

    free(q->array);
    q->array = NULL;

    free(q);
    q = NULL;

    return q;
}

