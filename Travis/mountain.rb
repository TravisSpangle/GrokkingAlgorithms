# Mountain
# You are provided a matrix of 0's and 1's. 
# This represents a mountain where a 0 is a skiable path 
# and 1 is a tree or a rock. 
#
# write a class that will 
# 1. Confirm the mountain has a skiable path from top to bottom
# 2. Return the skiable path

require 'pry'

class SkiPath
  def find_ski_path(mountain)
    queue_path = start_nodes(mountain[0])
    checked = []
    parents = {}
    loop do
      node = queue_path.shift
      checked << node
      return false if node.nil?
      if mountain[node[0]][node[1]] == "F"
        parents["F"] = parents[node.join("-")]
        return parents 
      end

      children = find_children(mountain, node)
      children.each do |child|
        next if checked.include? child
        parents[child.join("-")] = node.join("-")
        queue_path << child
      end
    end
  end

  def start_nodes(row)
    start_nodes = []
    row.each_with_index do | element, index|
      start_nodes << [0, index] if element.eql? 0
    end
    start_nodes
  end

  def find_children(mountain, node)
    begin
      children = []
      children << [node[0]-1, node[1]] if node[0] > 0 && mountain[node[0]-1][node[1]] != 1 
      children << [node[0], node[1]+1] if node[1] < mountain[node[0]].length && mountain[node[0]][node[1]+1] != 1 
      children << [node[0]+1, node[1]] if node[0]+1 < mountain.length && mountain[node[0]+1][node[1]] != 1 
      children << [node[0], node[1]-1] if node[1]-1 >= 0 && mountain[node[0]][node[1]-1] != 1 
    rescue
      binding.pry
    end

    children
  end
end

mountain = Array.new(6)
mountain[0] = [1,0,1,1,0,1]
mountain[1] = [0,0,0,1,0,0]
mountain[2] = [0,1,1,1,1,0]
mountain[3] = [0,0,0,1,1,0]
mountain[4] = [1,1,0,1,0,0]
mountain[5] = [1,1,0,1,'F',1]

puts "Mountain______________"
mountain.each do |row|
  puts row.inspect
end

ski_path = SkiPath.new
path = ski_path.find_ski_path(mountain)
node = path["F"]
trail = []
while node
  trail << node
  node = path[ node ]
end

trail = trail.reverse

trail.each do |node|
  begin
    row,col = node.split("-")
    mountain[row.to_i][col.to_i] = 2
  rescue
    binding.pry
  end
end

puts "Mountain_Solved_________"
mountain.each do |row|
  puts row.inspect
end

# Mountain______________
# [1, 0, 1, 1, 0, 1]
# [0, 0, 0, 1, 0, 0]
# [0, 1, 1, 1, 1, 0]
# [0, 0, 0, 1, 1, 0]
# [1, 1, 0, 1, 0, 0]
# [1, 1, 0, 1, "F", 1]
# Mountain_Solved_________
# [1, 0, 1, 1, 2, 1]
# [0, 0, 0, 1, 2, 2]
# [0, 1, 1, 1, 1, 2]
# [0, 0, 0, 1, 1, 2]
# [1, 1, 0, 1, 2, 2]
# [1, 1, 0, 1, "F", 1]
