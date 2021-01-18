def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

 puts factors(86)

# 1 --- and number that makes number % divisor == 0 true, is a factor,
# because it can divide into the number evenly with no remainders.

# 3 --- The line8 factors is how you access the returned value of the method
# definition. You could as easily explicitly put the word return before the
# word factors,  but it is not needed as it is the last expression in the method.
