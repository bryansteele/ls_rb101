def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)

# no

#  The method foo will always return 'yes'.
#  'yes'  gets evaluated against 'no' inside the bar method and 'yes' == 'no' is false.

