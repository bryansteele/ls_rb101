['ant', 'bear', 'caterpillar'].pop.size

#  => 11 --- Array#pop permenantly removes the last element from the array. Returning the removed element ( here, it would be "caterpillar"). Because we have the #size method chained onto the return value of #pop, We get a return value of 11, which is the size/length of the string.