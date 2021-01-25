{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# => [nil, "bear"] --- #map always returns an array. Here the condition in the block evaluated to nil because that is what the if statement returns if the none of the conditions evaluate to a true, therefore returned nil on the first iteration and on the second iteration the condition evaluated to a truthy value, therefore the value is returned.