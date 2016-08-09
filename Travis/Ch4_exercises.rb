def sum(array)
  return 0 if array.empty?

  array.shift + sum(array)
end


def find_max(array, max=0)
  return max if array.empty?

  element = array.shift
  max = element > max ? element : max
  find_max(array, max)
end 

def binary_search(array, target)
  return nil if array.empty?

  middle = array.length/2
  element = array[middle]

  if element == target
    return element 
  elsif element > target
    new_array = array.take(middle)
  else
    new_array = array.drop(middle)
  end

  binary_search(new_array, target)
end

#===================================================
puts sum([2,4,6])

max = find_max([1,4,9,3,2,99])
if max == 99
  puts "Found Max"
else
  puts "Max not found"
end

if binary_search(Array(0..50), 3) == 3
  puts "Found 3 in binary search"
else
  puts "Binary search could not find 3"
end

if binary_search(Array(0..50), 300).nil?
  puts "Binary search successfully returned nil"
else
  puts "Binary search failed to send nil"
end









