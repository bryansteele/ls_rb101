def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# https://docs.ruby-lang.org/en/3.0.0/doc/syntax/calling_methods_rdoc.html#label-Default+Positional+Arguments

# Ruby fils in the missing arguments from left to right.
# Ruby also, allows default values to appear in the middle of positional arguments. Because there are 2 defaults inthe middle, Ruby will assign 4 to a, 6 to d, and because ba dn c already have a default, Ruby will use the next one in line, which is 5 to b. Therefore we get 4, 5, 3, 6.