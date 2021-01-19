greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# {:a=>"hi there"}
# informal_greeting is referencing the original object.
# String#<< modifys the object that called it, therefore, mutating greetings.