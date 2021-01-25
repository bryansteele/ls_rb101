['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# 2 --- According to the Ruby Docs, the block is called on each element but the 
#       method only counts the element and returns the count of element if the
#       block returned a truthy value. The  method returns the count, which is
#       the number of element in which the block returned a truthy value.