require 'benchmark'
require_relative 'Ch2_SelectionSort'
require_relative 'Ch4_QuickSort'
require_relative 'InsertionSort'

selection = SelectionSort.new
quick     = QuickSort.new
insertion = InsertionSort.new

amount = 10**3
puts "Building array with #{amount} elements"
unsorted = Array(0..amount).shuffle
puts "Testing..."

Benchmark.bm do |sort|
  sort.report("selection") { selection.sort(unsorted.clone) }
  sort.report("quick    ") { quick.sort(unsorted.clone) }
  sort.report("insertion") { insertion.sort(unsorted.clone) }
end


# Building array with 10000 elements
# Testing...
#          user     system      total        real
# selection  3.340000   0.000000   3.340000 (  3.344400)
# quick      0.000000   0.000000   0.000000 (  0.000003)
