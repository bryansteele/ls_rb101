limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Because the local variable `limit` is initialized on the first line, there is no access to it from within the method definition, unless it is passed in as an argument at the method call. Ex. 