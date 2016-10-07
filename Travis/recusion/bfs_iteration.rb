require '../lib/wrapper.rb'
require '../lib/bfs_graph.rb'

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


  def self.seller?(person)
    person.eql? "Jaxon"
  end
end

measure do
 puts "using iteration"
 Search.bfs(GRAPH.clone)
end
