# Breadth-first-search

from collections import deque

graph = {
 'alice': ['peggy'],
 'anuj': [],
 'bob': ['anuj', 'peggy'],
 'claire': ['thom', 'jonny'],
 'jonny': [],
 'peggy': [],
 'thom': [],
 'you': ['alice', 'bob', 'claire']
 }

def person_is_seller(name):
	return name[-1] == 'm'

def bfs(name):
   search_queue = deque()
   search_queue += graph[name]
   searched = []
   while search_queue:
       person = search_queue.popleft()
       if person_is_seller(person):
           print(person + " is a mango seller")
           return True
       else:
           search_queue += graph[person]
           searched.append(person)
   return False
