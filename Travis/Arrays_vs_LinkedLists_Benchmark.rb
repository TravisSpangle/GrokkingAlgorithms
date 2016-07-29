class ArrayBenchmark
  attr_accessor :amount
  def initialize(amount=1000)
    @amount = amount
  end

  def run
    list = Array.new(4)

    # Insert @amount elements in the middle of the array
    @amount.times do
      middle = list.length/2
      list.insert(middle, "value")
    end

    # Delete elements in the middle until it's empty
    list.delete_at(list.length/2) until list.empty?
  end
end

class ListBenchmark
  attr_accessor :amount
  def initialize(amount=1000)
    @amount = amount
  end

  def run
    list = LinkedList.new
    @amount.times do
      list.add
    end

    @amount.times do 
      list.delete
    end
  end

  class Node
    attr_accessor :next,:value
    def initialize(value = "value")
      @value = value
    end
  end

  class LinkedList
    attr_accessor :head
    def initialize(node = Node.new)
      @head = node
    end

    def add
      node = find_last_node
      node.next = Node.new
    end

    def delete
      node = @head
      parent = @head

      while node.next != nil
        parent = node
        node = node.next
      end

      parent.next = nil
    end

    def find_last_node
      node = @head
      node = node.next unless node.next.nil?
      node
    end
    def display
      node = @head

      while node != nil do
        puts node.value
        node = node.next
      end
    end
  end
end

require 'benchmark'
amount = 10**5

arrays = ArrayBenchmark.new(amount)
lists = ListBenchmark.new(amount)

puts "running #{amount} iterations"

Benchmark.bm do |test|
  test.report("Array") { arrays.run }
  test.report("Links") { lists.run }
end

# running 100000 iterations
#       user     system      total        real
#       Array  1.410000   0.000000   1.410000 (  1.414985)
#       Links  0.040000   0.000000   0.040000 (  0.044408)

