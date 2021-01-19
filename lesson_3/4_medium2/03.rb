def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# pumpkins
# ["pumpkins", "rutabaga"]

# out of the 2 ruby methods inside the method definition, << is the only one that mutates the caller. Therefore, pushing the string onto the array as another element. my string outputs pumkins because it is not mutated from the reassignment inside the method definition.
