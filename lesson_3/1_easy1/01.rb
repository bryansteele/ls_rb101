numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers


# 1
# 2
# 2
# 3
# --- numbers variable was not modified as a result of the uniq method. Therefore when you call puts to print out the numbers array you are also calling #to_s.