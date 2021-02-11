['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# => 2
# Returns the count of elements for which the block returns a truthy value.
# can check the docs [here](https://docs.ruby-lang.org/en/3.0.0/Array.html#method-i-count)