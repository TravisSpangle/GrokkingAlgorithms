class ShellSort
  def self.sort(list)
    d = list.length
    return -1 if d == 0

    # You select and iterate over your gap sequence here.
    until d/2 == 0 do
      d = d / 2

      # Now you pick up an index i, and make sure every dth element,
      # starting from i is sorted.
      # i = 0
      # while i < list.length do
      0.step(list.length) do |i|

        # Okay we picked up index i. Now it's just plain insertion sort.
        # Only difference is that we take elements with constant gap, 
        # rather than taking them up serially.
        # igap = i + d
        # while igap < list.length do
        (i+d).step(list.length-1, d) do |igap| 

          # Just like insertion sort, we take up the last most value.
          # So that we can shift values greater than list[igap] to its side,
          # and assign it to a proper position we find for it later.
          temp = list[igap]
          j = igap
          while j >= i do
            break if list[j] >= list[j - d]
            list[j] = list[j-d]
            j -= d
          end
          # Okay this is where it belongs.
          list[j] = temp

          #igap += d
        end

        # i += 1
      end
    end
    list
  end
end
