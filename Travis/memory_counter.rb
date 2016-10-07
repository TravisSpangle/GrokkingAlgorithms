require "./lib/wrapper.rb"
require "./Ch4_QuickSort.rb"
require "./ShellSort.rb"

unsorted = (1..20_000).to_a.shuffle

puts "Shell sort - inplace sorting"
measure do
  ShellSort.sort(unsorted.clone)
end

puts "Quick sort"
measure do
  quick = QuickSort.new
  quick.sort(unsorted.clone)
end

# Output
# Shell sort - inplace sorting
# {"2.3.0":{"gc":"enabled","time":44.23,"gc_count":20,"memory":"0 MB"}}
# Quick sort
# {"2.3.0":{"gc":"enabled","time":0.05,"gc_count":5,"memory":"4 MB"}}
