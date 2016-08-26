#pragma once

typedef enum BfsStatus {
  gray,
  white,
  black
} BfsStatus;

typedef struct BfsVertex {
  int position;
  BfsStatus status;
  int distance;
  char *name;
  struct BfsVertex *predecessor;
} BfsVertex;

typedef struct BfsAdjacency {
  BfsVertex **edges;
  int edgeCount;
} BfsAdjacency;

typedef struct BfsGraph {
  int vertexCount;
  int edgeCount;
  BfsVertex **vertices;
  BfsAdjacency **adjacencies;
} BfsGraph;

void breadthFirstSearch(BfsGraph *g, BfsVertex *start);
void bfsGraphCreate(BfsGraph *g, BfsVertex *vertices[], BfsAdjacency *adjacencies[], int edgeCount);
void bfsGraphFree(BfsGraph *g);
void bfsPrintVertexPath(BfsGraph *g, BfsVertex *vertexX, BfsVertex *vertexY, int counter);

typedef struct BfsQueue {
  int head;
  int tail;
  int size;
  BfsVertex **queue;
} BfsQueue;

void bfsQueueCreate(BfsQueue *q, int size);
BfsVertex* bfsQueuePop(BfsQueue *q);
void bfsQueuePush(BfsQueue *q, BfsVertex *v);
