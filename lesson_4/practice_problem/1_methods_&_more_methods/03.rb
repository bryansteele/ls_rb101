[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3] #reject passes in each element to the block. If the return value of the block false/nil thanthat element will be included in the new array that the method returns.