['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# => { "a" => "ant", "b" => "bear", "c" => "cat" } --- The variable named hash is initialized to an empty hash in the block. Each iteration the array's elements are passed in to the block as well as the empty hash.
# On the first iteration, "a" => "ant" is added to the empty hash, then "b" => "bear" and the same with c - cat. The method returns the hash that was passed in with the element modified from in the block. In this case it ends up being key/valu pairs.

