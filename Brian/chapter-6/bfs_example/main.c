#include <stdio.h>
#include <stdlib.h>
#include "bfs_graph.h"

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
  bfsQueueInit(&q, g->edgeCount);


  BfsVertex *vertex = start;
  while(vertex != NULL) {
    BfsAdjacency *adjacency = g->adjacencies[vertex->position];

    int k;
    for(k = 0; k < adjacency->edgeCount; k++) {
      BfsVertex *adjacentVertex = adjacency->edges[k];

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

void printBfsVertexPath(BfsVertex *vertexX, BfsVertex *vertexY, int counter) {
  if(vertexX == vertexY) {
    printf("Landed at start in %i steps!\n", counter);
    return;
  }

  if(vertexY->predecessor == NULL) {
    printf("No path from %s to %s!\n", vertexX->name, vertexY->name);
    return;
  }

  printf("searched %s, going to %s\n", vertexY->name, vertexY->predecessor->name);

  printBfsVertexPath(vertexX, vertexY->predecessor, counter + 1);
}

void generateBfsGraph(BfsGraph *g);

int main() {
  BfsGraph g;
  generateBfsGraph(&g);

  //me
  BfsVertex *me = g.vertices[0];
  BfsVertex *mangoSeller = g.vertices[5];

  //converting graph into breadth first tree
  //of vertices accessible from "me"
  breadthFirstSearch(&g, me);

  printf("Printing path details:\n");

  int counter = 0;
  printBfsVertexPath(me, mangoSeller, 0);

  printf("Path search complete\n");

  return 0;
}


void generateBfsGraph(BfsGraph *g) {
  char *names[] = {"Brian", "Daniel", "Steve", "Brett", "Trever", "Mr Mango"};
  int vertexCount = 6;
  BfsVertex **vertices = (BfsVertex **)malloc(sizeof(BfsVertex *)*vertexCount);

  int i;
  for(i = 0; i < 6; i++) {
    BfsVertex *vertex = (BfsVertex *)malloc(sizeof(BfsVertex));
    vertex->name = names[i];
    vertex->position = i;

    vertices[i] = vertex;
  }

  int totalEdges = 0;

  BfsAdjacency **adjacencies = (BfsAdjacency **)malloc(sizeof(BfsAdjacency *)*vertexCount);

	BfsAdjacency *firstAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	firstAdjacency->edgeCount = 2;
	BfsVertex **firstEdges = (BfsVertex **)malloc(sizeof(BfsVertex *)*2);
  firstEdges[0] = vertices[1];
  firstEdges[1] = vertices[2];
	firstAdjacency->edges = firstEdges;
	adjacencies[0] = firstAdjacency;
	totalEdges = totalEdges + 2;
	
	BfsAdjacency *secondAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	secondAdjacency->edgeCount = 2;
	BfsVertex **secondEdges = (BfsVertex **)malloc(sizeof(BfsVertex *)*2);
  secondEdges[0] = vertices[3];
  secondEdges[1] = vertices[2];
	secondAdjacency->edges = secondEdges;
	adjacencies[1] = secondAdjacency;
	totalEdges = totalEdges + 2;
	
	BfsAdjacency *thirdAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	thirdAdjacency->edgeCount = 2;
	BfsVertex **thirdEdges = (BfsVertex **)malloc(sizeof(BfsVertex *)*2);
  thirdEdges[0] = vertices[3];
  thirdEdges[1] = vertices[4];
	thirdAdjacency->edges = thirdEdges;
	adjacencies[2] = thirdAdjacency;
	totalEdges = totalEdges + 2;
	
	BfsAdjacency *fourthAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency *)*2);
	fourthAdjacency->edgeCount = 2;
	BfsVertex **fourthEdges = (BfsVertex **)malloc(sizeof(BfsVertex *)*2);
  fourthEdges[0] = vertices[2];
  fourthEdges[1] = vertices[4];
	fourthAdjacency->edges = fourthEdges;
	adjacencies[3] = fourthAdjacency;
	totalEdges = totalEdges + 2;
	
	BfsAdjacency *fifthAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	fifthAdjacency->edgeCount = 2;
	BfsVertex **fifthEdges = (BfsVertex **)malloc(sizeof(BfsVertex *)*2);
  fifthEdges[0] = vertices[1];
  fifthEdges[1] = vertices[5];
	fifthAdjacency->edges = fifthEdges;
	adjacencies[4] = fifthAdjacency;
	totalEdges = totalEdges + 2;
	
	BfsAdjacency *sixthAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	sixthAdjacency->edgeCount = 2;
	BfsVertex **sixthEdges = (BfsVertex **)malloc(sizeof(BfsVertex *)*2); 
  sixthEdges[0] = vertices[3];
  sixthEdges[1] = vertices[1];
	sixthAdjacency->edges = sixthEdges;
	adjacencies[5] = sixthAdjacency;
	totalEdges = totalEdges + 2;

  bfsGraphInit(g, vertices, vertexCount, adjacencies, totalEdges);
}
