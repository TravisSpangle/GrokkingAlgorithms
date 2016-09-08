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

void bfsGraphInit(BfsGraph *g, BfsVertex *vertices[], int vertexCount, BfsAdjacency *adjacencies[], int edgeCount);
void bfsGraphFree(BfsGraph *g);

typedef struct BfsQueue {
  int head;
  int tail;
  int size;
  BfsVertex **queue;
} BfsQueue;

void bfsQueueInit(BfsQueue *q, int size);
BfsVertex* bfsQueuePop(BfsQueue *q);
void bfsQueuePush(BfsQueue *q, BfsVertex *v);
