arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |arr|
  arr.select do |num|
    num % 2 != 0
  end
end