[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3] --- #select is returning an array of all elements in the
#                   original array, for which the block returns a truthy 
#                   value. Here, the block will always return a truthy
#                   value because 'hi' is the last line in the block.