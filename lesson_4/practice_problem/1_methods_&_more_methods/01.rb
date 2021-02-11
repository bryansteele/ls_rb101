[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# 'hi' is the last expresion in the block and #select only cares about truthy values returned after each iteration, since 'hi' is concidered  truthy, the value for that iteration is returned. 