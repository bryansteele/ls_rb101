def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# pumkinsrutabaga
# ["pumpkins"]

# This is just the oposite of the last question. The String object is mutated because of the <<, which concatenates the 2 strings together.
# The array object is not mutated as a copy was passed in and it is just a reassignment.