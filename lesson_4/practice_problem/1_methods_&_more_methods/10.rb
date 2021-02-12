[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

=begin

=> [1, nil, nil]
Becuase on the first iteration, the if statement evaluated the else: which returns the num, 1.
The other two iterations evaluate the if condition to true therefore the puts num is executed and nil is retured.