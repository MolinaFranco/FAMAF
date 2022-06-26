#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include "pstack.h"

struct s_pstack {
    unsigned int size;
    struct s_node *first;
};

struct s_node {
    pstack_elem elem;
    unsigned int prio;
    struct s_node *next;
};

static struct s_node * create_node(pstack_elem e, priority_t priority) {
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


static bool invrep(pstack s) {
    bool inv = (s!=NULL);
    if(inv){
        struct s_node *p = s->first;
        if(p!=NULL){
            while(p->next!=NULL && inv){
                inv = inv && (p->prio>=p->next->prio);
                p = p->next;
            }
        }
    }

    return inv;
}

pstack pstack_empty(void) {
    pstack s=NULL;

    s = malloc(sizeof(struct s_pstack));
    assert(s!=NULL);
    s->size = 0;
    s->first = NULL;

    return s;
}


pstack pstack_push(pstack s, pstack_elem e, priority_t priority) {
    assert(invrep(s));
    struct s_node *new_node = create_node(e, priority);
    
    if(s->first == NULL){
        s->first = new_node;
    }else if (s->first->prio<new_node->prio){
        new_node->next = s->first;
        s->first = new_node;
    }else{
        struct s_node *fi = s->first;
        struct s_node *se = fi->next;
        while (se!=NULL && se->prio>new_node->prio){
            fi = se;
            se = se->next;
        }
        fi->next = new_node;
        new_node->next = se;
    }
    ++s->size;
    return s;
}

bool pstack_is_empty(pstack s) {
    assert(invrep(s));
    return s->size==0;
}

pstack_elem pstack_top(pstack s) {
    assert(invrep(s));
    return s->first->elem;
}

priority_t pstack_top_priority(pstack s) {
    return s->first->prio;
}

unsigned int pstack_size(pstack s) {
    assert(invrep(s));
    return s->size;
}

pstack pstack_pop(pstack s) {
    assert(invrep(s) && (s->first!=NULL));
    struct s_node *p = s->first;
    s->first = s->first->next;
    destroy_node(p);
    --s->size;
    return s;
}

pstack pstack_destroy(pstack s) {
    assert(invrep(s));
    
    while(s->first!=NULL){
        pstack_pop(s);
    }

    free(s);
    s = NULL;

    assert(s == NULL);
    return s;
}

