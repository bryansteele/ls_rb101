{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

=begin

=> {nil, bear}

map always return a new array.
The if condition eveluates to true  on the second iteration. Which means the first element is false and the value isn't returned.

when an if statement has no conditions that evaluate to true, it returns nil.

Therefore we see nil on the first iteration.

=end