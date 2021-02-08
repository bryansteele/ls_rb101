# puts "the value of 40 + 2 is " + (40 + 2)

# Can't concatenate an integer and string (two different types).
# 2 ways to fix this:

puts "the value of 40 + 2 is #{40 + 2}" #or

puts "the value of 40 + 2 is " + (40 + 2).to_s
