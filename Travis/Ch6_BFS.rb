require './lib/wrapper.rb'
require './lib/bfs_graph.rb'

class Search
  def self.bfs
    search_queue = ["you"]
    parents = {}
    checked = []
    pushed = 0
    while search_queue
      node = search_queue.shift
      pushed += 1
      checked << node
      return "pushed: #{pushed} " if self.seller?(node)

      GRAPH[node].each do |child|
        search_queue.push child unless checked.include? child
        parents[child] = node if parents[child].nil?
      end
    end 

    return false
  end

  def self.dfs
    search_stack = ["you"]
    parents = {}
    checked = []
    pushed = 0
    while search_stack
      node = search_stack.pop
      pushed += 1
      checked << node
      return "pushed: #{pushed} " if self.seller?(node)

      GRAPH[node].each do |child|
        search_stack.push child unless checked.include? child
        parents[child] = node if parents[child].nil?
      end
    end 

    return false
  end

  def self.seller?(person)
    person[-1].eql? "m"
  end

  def self.path(parents,node)
    path = []
    
    while node != "you"
      path << node
      node = parents[node]
    end

    path.push("you").reverse.join(" -> ")
  end

  def self.seller?(person)
    person.eql? "Jaxon"
  end
end

measure { puts Search.bfs }
measure { puts Search.dfs }

# bfs
# pushed: 1479
# {"2.3.0":{"gc":"enabled","time":0.02,"gc_count":1,"memory":"12 KB"}}
# dfs
# pushed: 3383
# {"2.3.0":{"gc":"enabled","time":0.07,"gc_count":1,"memory":"8 KB"}}
