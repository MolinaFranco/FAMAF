#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "graph.h"

struct graph_data {
    cost_t *costs;
    unsigned int max_vertexs;
};

static unsigned int g_index(vertex_t j, vertex_t i, unsigned int max_vertexs) {
    return (j * max_vertexs) + i;
}

static bool invrep(graph_t g) {
    
    bool null = (g!=NULL);
    bool diago = true;

    for(vertex_t i = 0; i < g->max_vertexs && diago; ++i) {
        diago = g->costs[g_index(i, i, g->max_vertexs)] == 0;
    }

    return ( null && diago );
}

graph_t graph_empty(unsigned int max_vertexs)
{
    graph_t graph = calloc(1, sizeof(struct graph_data));
    assert(invrep(graph));
    graph->max_vertexs = max_vertexs;
    graph->costs = calloc(max_vertexs * max_vertexs, sizeof(cost_t));
    for (unsigned int i = 0; i < max_vertexs * max_vertexs; ++i) {
        graph->costs[i] = cost_inf();
    }
    for(vertex_t i = 0; i < graph->max_vertexs; ++i) {
        graph->costs[g_index(i, i, graph->max_vertexs)] = 0;
    }
    assert(invrep(graph) && graph->costs != NULL);
    return graph;
}

unsigned int graph_max_vertexs(graph_t graph)
{
    assert(graph != NULL);
    return graph->max_vertexs;
}

void graph_add_edge(graph_t graph, vertex_t from, vertex_t to, cost_t cost)
{
    assert(invrep(graph));
    assert(from < graph->max_vertexs);
    assert(to < graph->max_vertexs);

    unsigned int max = graph_max_vertexs(graph);
    graph->costs[g_index(from, to, max)] = cost;

    assert(invrep(graph));
}

cost_t graph_get_cost(graph_t graph, vertex_t from, vertex_t to)
{
    assert(invrep(graph));
    assert(from < graph->max_vertexs);
    assert(to < graph->max_vertexs);
    unsigned int index=0u;
    
    index = g_index(from, to, graph_max_vertexs(graph));

    return graph->costs[index];
}

graph_t graph_destroy(graph_t graph)
{
    assert(invrep(graph));
    
    free(graph->costs);
    graph->costs = NULL;
       
    free(graph);
    graph = NULL;

    assert(graph == NULL);
    return graph;
}

void graph_print(graph_t graph)
{
    assert(invrep(graph));
    printf("%u\n", graph->max_vertexs);
    for (unsigned int i = 0; i < graph->max_vertexs; ++i) {
        for (unsigned int j = 0; j < graph->max_vertexs; ++j) {
            const cost_t cost = graph_get_cost(graph, i, j);
            if (cost_is_inf(cost)) {
                printf("# ");
            } else {
                printf("%d ", cost);
            }
        }
        printf("\n");
    }
}

graph_t graph_from_file(const char *file_path)
{
    FILE *file = fopen(file_path, "r");
    if (file == NULL) {
        fprintf(stderr, "File does not exist.\n");
        exit(EXIT_FAILURE);
    }
    unsigned int tam = 0;
    fscanf(file, "%u", &tam);
    char word[256];
    const graph_t graph = graph_empty(tam);
    //i = from
    for (unsigned int i = 0; i < tam; ++i) {
        //j = to
        for (unsigned int j = 0; j < tam; ++j) {
            cost_t cost = cost_inf();
            fscanf(file, "%s", word);
            if (word[0] != '#') {
                cost = atoi(word);
            }
            graph_add_edge(graph, i, j, cost);
        }
    }
    fclose(file);
    return graph;
}
