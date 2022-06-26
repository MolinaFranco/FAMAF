#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include "pqueue.h"

struct s_pqueue {
    unsigned int size;
    struct s_node *first;
};

struct s_node {
    pqueue_elem elem;
    int prio;
    struct s_node *next;
};

static struct s_node * create_node(pqueue_elem e, unsigned int priority) {
    struct s_node *new_node = NULL;
    new_node = malloc(sizeof(struct s_node));
    assert(new_node!=NULL);
    new_node->elem = e;
    new_node->prio = priority;
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
        struct s_node *p = q->first;
        if(p!=NULL){
            while(p->next!=NULL && inv){
                inv = inv && (p->prio>=p->next->prio);
                p = p->next;
            }
        }
    }

    return inv;
}

pqueue pqueue_empty(void) {
    pqueue q=NULL;

    q = malloc(sizeof(struct s_pqueue));
    assert(q!=NULL);
    q->size = 0;
    q->first = NULL;

    return q;
}

pqueue pqueue_enqueue(pqueue q, pqueue_elem e, unsigned int priority) {
    assert(invrep(q));
    struct s_node *new_node = create_node(e, priority);
    
    if(q->first == NULL){
        q->first = new_node;
    }else if (q->first->prio<new_node->prio){
        new_node->next = q->first;
        q->first = new_node;
    }else{
        struct s_node *fi = q->first;
        struct s_node *se = fi->next;
        while (se!=NULL && se->prio>=new_node->prio){
            fi = se;
            se = se->next;
        }
        fi->next = new_node;
        new_node->next = se;
    }
    ++q->size;

    assert(e==e && priority==priority && new_node==new_node); // BORRAR ESTE ASSERT
    return q;
}

bool pqueue_is_empty(pqueue q) {
    assert(invrep(q));
    return q->size==0;
}

pqueue_elem pqueue_peek(pqueue q) {
    assert(invrep(q));
    return q->first->elem;
}

unsigned int pqueue_peek_priority(pqueue q) {
    assert(invrep(q));
    return q->first->prio;
}

unsigned int pqueue_size(pqueue q) {
    return q->size;
}

pqueue pqueue_dequeue(pqueue q) {
    assert(invrep(q) && (q->first!=NULL));
    struct s_node *p = q->first;
    q->first = q->first->next;
    destroy_node(p);
    --q->size;
    return q;
}

pqueue pqueue_destroy(pqueue q) {
    assert(invrep(q));
    while(q->first!=NULL){
        pqueue_dequeue(q);
    }
    free(q);
    q = NULL;

    return q;
}
