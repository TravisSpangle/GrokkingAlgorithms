require './lib/wrapper.rb'
require './lib/bfs_graph.rb'

class Search
  def self.bfs(graph)
    search_queue = ["you"]
    parents = {}
    while search_queue
      node = search_queue.pop

      return true if self.seller?(node)

      graph.delete(node){|k| [] }.each do |child|
        search_queue.push child 
        parents[child] = node if parents[child].nil?
      end
    end

    false
  end

  def self.bfs_recursion(search_queue: ["you"], parents: {}, graph: )
    return false if search_queue.empty?

    node = search_queue.pop

    return true if self.seller?(node)

    graph.delete(node){|k| [] }.each do |child|
      search_queue.push child
      parents[child] = node if parents[child].nil?
    end

    Search.bfs_recursion(search_queue: search_queue, parents: parents, graph: graph)
  end

  def self.seller?(person)
    person.eql? "Jaxon"
  end
end

graph1 = GRAPH.clone
graph2 = GRAPH.clone
measure do
  puts Search.bfs(graph1)
end

measure do
  puts Search.bfs_recursion(graph: graph2)
end

# bfs, 3383 passes
# {"2.3.0":{"gc":"enabled","time":0.07,"gc_count":1,"memory":"40 KB"}}
# true
# bfs recursion, 3383 passes
# {"2.3.0":{"gc":"enabled","time":0.07,"gc_count":1,"memory":"416 KB"}}
