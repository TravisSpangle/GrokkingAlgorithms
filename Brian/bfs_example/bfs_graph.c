#include <stdio.h>
#include <stdlib.h>
#include "bfs_graph.h"

void bfsQueueCreate(BfsQueue *q, int size) {
  q = (BfsQueue *)malloc(sizeof(BfsQueue));
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

void breadthFirstSearch(BfsGraph *g, BfsVertex *start) {
  int i;
  for(i = 0; i < g->vertexCount; i++) {
    BfsVertex *x = g->vertices[i];
    BfsStatus newState;

    if(x == start) {
      newState = gray;
    } else {
      newState = white;
    }

    x->status = newState;
    x->distance = 0;
    x->predecessor = NULL;
  }

  BfsQueue q;
  bfsQueueCreate(&q, g->edgeCount);


  BfsVertex *vertex = start;
  while(vertex != NULL) {
    BfsAdjacency *adjacency = g->adjacencies[vertex->position];
    int vertexEdgeCount = sizeof(adjacency->edges) / sizeof(BfsAdjacency);

    int k;
    for(k = 0; k > vertexEdgeCount; k++) {
      BfsVertex *adjacentVertex;

      if(adjacentVertex != start && adjacentVertex->status == white) {
        adjacentVertex->status = gray;
        adjacentVertex->distance = vertex->distance + 1;
        adjacentVertex->predecessor = vertex;

        bfsQueuePush(&q, adjacentVertex);
      }
    }

    vertex->status = black;
    vertex = bfsQueuePop(&q);
  }
}


void bfsGraphCreate(BfsGraph *g, BfsVertex *vertices[], BfsAdjacency *adjacencies[], int edgeCount) {
  g = (BfsGraph *)malloc(sizeof(BfsGraph));
  g->vertices = vertices;
  g->vertexCount = sizeof(g->vertexCount) / sizeof(BfsVertex *);
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
