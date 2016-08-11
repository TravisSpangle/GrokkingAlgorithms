class QuickSort
  def sort(array)
    return array if array.length < 2

    pivot   = array.delete_at(rand(array.length))
    less    = array.select { |element| element <= pivot }
    greater = array.select { |element| element > pivot }

    sort(less) + [pivot] + sort(greater)
  end
end

class QuickMiddle
  def sort(array)
    return array if array.length < 2

    pivot   = array.delete_at(array.length/2)
    less    = array.select { |element| element <= pivot }
    greater = array.select { |element| element > pivot }

    sort(less) + [pivot] + sort(greater)
  end
end

require 'benchmark'

quick  = QuickSort.new
middle = QuickMiddle.new

3.times do
  num = 6
  amount = 10**num
  unsorted = Array(0..amount).shuffle

  Benchmark.bm do |sort|
    sort.report("quick  #{num}") { quick.sort(unsorted.clone) }
    sort.report("middle #{num}") { middle.sort(unsorted.clone) }
  end
end

# user     system      total        real
# quick  5  0.280000   0.010000   0.290000 (  0.279680)
# middle 5  0.250000   0.000000   0.250000 (  0.254528)
# user     system      total        real
# quick  6  3.040000   0.040000   3.080000 (  3.085613)
# middle 6  2.980000   0.040000   3.020000 (  3.024720)
# user     system      total        real
# quick  7 36.170000   0.720000  36.890000 ( 36.893500)
# middle 7 35.870000   0.800000  36.670000 ( 36.679982)
# 
# Round 2
# user     system      total        real
# quick  5  0.270000   0.010000   0.280000 (  0.272397)
# middle 5  0.270000   0.000000   0.270000 (  0.277711)
# user     system      total        real
# quick  6  3.230000   0.050000   3.280000 (  3.279375)
# middle 6  2.980000   0.050000   3.030000 (  3.031815)
# user     system      total        real
# quick  7 36.450000   0.760000  37.210000 ( 37.230129)
# middle 7 36.580000   0.790000  37.370000 ( 37.392686)
