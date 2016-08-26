#include <stdio.h>
#include <string.h>

void bfsPrintVertexPath(BfsGraph *g, BfsVertex *vertexX, BfsVertex *vertexY, int counter) {
  if(vertexX == vertexY) {
    printf("Landed at in %i steps!\n", counter);
    return;
  }

  if(vertexY->predecessor == NULL) {
    printf("No path from %s to %s!\n", vertexX->name, vertexY->name);
    return;
  }

  printf("searched %s, going to %s\n", vertexY->name, vertexY->predecessor->name)

  bfsPrintVertexPath(g, vertexX, vertexY->predecessor);
}

void bfsGenerateGraph(BfsGraph *g) {
  g = (BfsGraph *)malloc(sizeof(BsfGraph));
  
  char *names[6] = ["Brian", "Daniel", "Steve", "Brett", "Trever", "Maxim"];
  BfsVector *vertices[6];

  int i;
  for(i = 0; i < 6; i++) {
    BfsVertex *vertex = (BfsVertex *)malloc(sizeof(BfsVertex));
    vertex->name = names[i];
    vertex->position = i;
  }

  int totalEdges = 0;

	BfsAdjacency *adjacencies[6];
	BfsAdjacency *firstAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	firstAdjacency->edgeCount = 2;
	BfsVector *firstEdges[2] = [vertices[1], vertices[5]];
	firstAdjacency->edges = edges;
	totalEdges + 2;
	
	BfsAdjacency *adjacencies[6];
	BfsAdjacency *secondAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	secondAdjacency->edgeCount = 2;
	BfsVector *secondEdges[2] = [vertices[3], vertices[2]];
	secondAdjacency->edges = edges;
	totalEdges + 2;
	
	BfsAdjacency *adjacencies[6];
	BfsAdjacency *thirdAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	thirdAdjacency->edgeCount = 3;
	BfsVector *thirdEdges[3] = [vertices[3], vertices[4], vertices[5]];
	thirdAdjacency->edges = edges;
	totalEdges + 3;
	
	BfsAdjacency *adjacencies[6];
	BfsAdjacency *fourthAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	fourthAdjacency->edgeCount = 2;
	BfsVector *fourthEdges[2] = [vertices[2], vertices[2]];
	fourthAdjacency->edges = edges;
	totalEdges + 2;
	
	BfsAdjacency *adjacencies[6];
	BfsAdjacency *fifthAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	fifthAdjacency->edgeCount = 2;
	BfsVector *fifthEdges[2] = [vertices[1], vertices[2]];
	fifthAdjacency->edges = edges;
	totalEdges + 2;
	
	BfsAdjacency *adjacencies[6];
	BfsAdjacency *sixthAdjacency = (BfsAdjacency *)malloc(sizeof(BfsAdjacency));
	sixthAdjacency->edgeCount = 2;
	BfsVector *sixthEdges[2] = [vertices[3], vertices[1]];
	sixthAdjacency->edges = edges;
	totalEdges + 2;

  BfsVector me = (BfsVector *)malloc(sizeof(BfsVector));
  me->name = "brian";
  g->vertices = 
}
