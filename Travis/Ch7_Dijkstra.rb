graph           = {}
graph["book"]   = {"lp"=>5, "poster"=>0}
graph["lp"]     = {"guitar" => 15, "drums" => 20}
graph["poster"] = {"guitar" => 30, "drums" =>35}
graph["drums"]  = {"piano" => 10}
graph["guitar"] = {"piano" => 20}
graph["piano"]  = {}

costs           = Hash.new(Float::INFINITY)
costs["lp"]     = 5
costs["poster"] = 0

parents = {"lp" => "book", "poster" => "book"}

@proccessed = []

def find_lowest_cost_node(costs)
  lowest_cost = Float::INFINITY
  lowest_cost_node = nil
  costs.each do |node, value|
    if value < lowest_cost && !(@proccessed.include? node)
      lowest_cost = value
      lowest_cost_node = node
    end
  end
  lowest_cost_node
end

def find_lowest_cost_node(costs:, lowest_cost:Float::INFINITY, lowest_cost_node:nil)
  return lowest_cost_node if costs.count.zero?

  node, value = costs.shift
  if value < lowest_cost && !(@proccessed.include? node)
    lowest_cost = value
    lowest_cost_node = node
  end

  find_lowest_cost_node(costs:costs, lowest_cost:lowest_cost, lowest_cost_node: lowest_cost_node)
end

def print_path(parents)
  parent = "piano"
  path = []
  loop do 
    path << parent
    parent = parents[parent]
    break if  parent.nil?
  end

  puts path.reverse.join(" -> ")
end

node = find_lowest_cost_node(costs:costs)

while node
  cost = costs[node]
  neighbors = graph[node]
  for n in neighbors.keys
    new_cost = cost + neighbors[n]
    if costs[n] > new_cost
      costs[n] = new_cost
      parents[n] = node
    end
  end
  @proccessed << node
  node = find_lowest_cost_node(costs:costs)
end

print_path(parents)
