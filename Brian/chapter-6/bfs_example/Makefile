CC=gcc
CFLAGS=-c -ggdb

all: bfs_example

clean: 
	rm -rf main.o bfs_graph.o bfs_example

bfs_example: main.o bfs_graph.o
	$(CC) main.o bfs_graph.o -o bfs_example

main.o:
	$(CC) $(CFLAGS) main.c -o main.o

bfs_graph.o:
	$(CC) $(CFLAGS) bfs_graph.c -o bfs_graph.o
