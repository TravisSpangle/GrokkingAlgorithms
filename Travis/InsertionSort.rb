class InsertionSort
  def sort(array)
    (0...array.length).each do |pivot|
      pivot_value = array[pivot]
      before_pivot = pivot - 1
      while before_pivot >= 0 && array[before_pivot] > pivot_value
        array[before_pivot+1] = array[before_pivot]
        before_pivot -= 1
      end
      array[before_pivot+1] = pivot_value
    end
    array
  end
end

# insertion = InsertionSort.new
# puts insertion.sort([5,30,40,1]).inspect
