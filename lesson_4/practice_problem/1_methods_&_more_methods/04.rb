['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}

# New hash is passed in as a method argument with the name of hash. each iteration, the hash is passed into the block and is updated with the values of the array and the method returns the new hash. 