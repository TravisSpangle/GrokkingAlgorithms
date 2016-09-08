#include <stdio.h>
#include <stdlib.h>
#include "bfs_graph.h"

void bfsQueueInit(BfsQueue *q, int size) {
  q->size = size;
  q->head = 0;
  q->tail = 0;
  q->queue = (BfsVertex **) malloc(sizeof(BfsVertex) * size);
}

void bfsQueueFree(BfsQueue *q) {
  free(q->queue);
  free(q);
}

BfsVertex* bfsQueuePop(BfsQueue *q) {
  BfsVertex* v = q->queue[q->tail];
  q->queue[q->tail] = NULL;

  if(q->tail == q->size - 1) {
    q->tail = 0;
  }
  else {
    q->tail++;
  }

  return v;
}

void bfsQueuePush(BfsQueue *q, BfsVertex *v) {
  q->queue[q->head] = v;

  if(q->head > q->size - 1) {
    q->head = 0;
  }
  else {
    q->head++;
  }
}


void bfsGraphInit(BfsGraph *g, BfsVertex *vertices[], int vertexCount, BfsAdjacency *adjacencies[], int edgeCount) {
  g->vertices = vertices;
  g->vertexCount = vertexCount;
  g->adjacencies = adjacencies;
  g->edgeCount = edgeCount;
}

void bfsGraphFree(BfsGraph *g) {
  int i;
  for(i = 0; i < g->vertexCount; i++) {
    free(g->vertices[i]);

    free(g->adjacencies[i]->edges);
    free(g->adjacencies[i]);
  }

  free(g->vertices);
  free(g->adjacencies);
  free(g);
}
