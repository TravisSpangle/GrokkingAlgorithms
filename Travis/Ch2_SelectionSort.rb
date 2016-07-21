class SelectionSort
  attr_accessor :array

  def sort(array)
    @array = array
    sorted = []

    sorted << find_smallest until @array.empty?

    sorted
  end

  private

  def find_smallest
    smallest = @array.first
    smallest_index = 0

    @array.each_with_index do |value, index|
      if value < smallest
        smallest       = value
        smallest_index = index
      end
    end

    @array.delete_at(smallest_index)
  end
end

selection = SelectionSort.new
puts selection.sort([2, 3, 1, 2, 10]).inspect
