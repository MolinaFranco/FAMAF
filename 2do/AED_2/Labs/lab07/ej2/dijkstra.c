#include <assert.h>
#include <stdlib.h>

#include "cost.h"
#include "graph.h"
#include "mini_set.h"

vertex_t get_min(set NV, cost_t * costos, unsigned int max){

    // “elijo elemento c de C tal que D[c] sea mínimo”
    
    assert(!set_is_empty(NV));

    vertex_t min = set_get(NV);

    for (vertex_t i = 0; i < max; i++){
        if(set_member(i,NV) && cost_lt(costos[i], costos[min])){
            min = i;
        }

    }

    return min;
}

cost_t *dijkstra(graph_t graph, vertex_t v) {

    unsigned int max = graph_max_vertexs(graph);

    cost_t * costos = calloc(max, sizeof(cost_t)); 
    int min;
    set NV = set_empty();

    for (unsigned int i = 0; i < max; i++){
        NV = set_add(NV,i); 
    }

    NV = set_elim(NV,v);

    for (unsigned int j = 1; j < max; j++){
        costos[j] = graph_get_cost(graph, v, j);
    }

    while (!set_is_empty(NV)){

        min = get_min(NV, costos, max);
        NV = set_elim(NV,min);
        
        for (unsigned int j = 0; j < max; j++){
            cost_t sum = cost_sum(costos[min], graph_get_cost(graph,min,j));
            if(cost_lt(sum, costos[j])){
                costos[j] = sum;
            }
        }
        
    }    

    return costos;
}

