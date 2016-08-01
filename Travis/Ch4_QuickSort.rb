class QuickSort
  def sort(array)
    return array if array.length < 2

    pivot   = array.delete_at(rand(array.length))
    less    = array.select { |element| element <= pivot }
    greater = array.select { |element| element > pivot }

    sort(less) + [pivot] + sort(greater)
  end
end

array = Array(0..10**3)

quick = QuickSort.new
puts quick.sort(array).inspect
