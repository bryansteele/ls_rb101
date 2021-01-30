# input: 1 integer
# output: boolean

# - integer passed in can be  +, - or 0.

# - If the integer's absolute value is odd. return true
# - We are assuming the arghument is a valid int without varifying.
#  From he test cases, we will return false if the absolute is not odd.

# absolute of -4 is 4 
# absolute of 4 is 4      --- the number of units from zero.
#  Absolutes will alwasy be a + number.

# if NUM's absolute is odd
# then return true
# else return false

# def is_odd?(num)
#   num.abs % 2 != 0
# end

def is_odd?(num)
  num.remainder(2) != 0
end


puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true