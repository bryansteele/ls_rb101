name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# Alice
# Bob

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin

BOB
BOB

name and save_name are both pointing to the same String object with a value of "Bob".
It appears that the same String object is 'passed by reference' to the method upcase!, which upcases all the letters. Because both local variables are pointing to the same object, they both refernce "BOB".

If we used the method upcase (without the `!`), a copy of the String object would have been passed in, therefore the save_name would still be pointing to the  object with a value of "Bob"
=end
