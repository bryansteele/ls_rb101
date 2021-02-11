[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]
# Returns a new array with the elements from the original array, for which the block returns false or nil.
# https://docs.ruby-lang.org/en/3.0.0/Array.html#method-i-reject