require '../lib/wrapper.rb'
require '../lib/bfs_graph.rb'
require '../lib/tail_call_optimization.rb'

class Search
  extend ::TailCallOptimization

  tailrec def bfs_recursion(search_queue: ["you"], parents: {}, graph: )
    return false if search_queue.empty?

    node = search_queue.pop

    return true if node.eql? "Jaxon"

    graph.delete(node){|k| [] }.each do |child|
      search_queue.push child
      parents[child] = node if parents[child].nil?
    end

    bfs_recursion(search_queue: search_queue, parents: parents, graph: graph)
  end

  def self.seller?(person)
    person.eql? "Jaxon"
  end
end

measure do
  puts "recursion"
  Search.new.bfs_recursion(graph: GRAPH.clone)
end
