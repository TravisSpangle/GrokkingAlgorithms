def countdown(i)
  return if i <= 0
  puts i

  countdown(i-1)
end

countdown(10)
