def find_smallest arr
	smallest, smallest_idx = arr[0], 0

	arr.each_with_index do |element, idx|
		smallest, smallest_idx = element, idx if element < smallest
	end
	smallest_idx
end

arr = (1..10).to_a.shuffle

puts "Initial: #{arr.inspect}"

sorted = []
sorted << arr.delete_at(find_smallest(arr)) until arr.empty? 

puts "Sorted: #{sorted.inspect}"
