def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  
  factors
end

puts factors(-0)

# 1 - `number % divisor == 0` finds the factors by using the modulo operator. If equal to 0 then it means that it divides eaually and is a factor.

# 2 - `factors` at the end of the method is explicitly returning the local variable `factors` for the method definition.