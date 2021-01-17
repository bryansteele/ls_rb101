puts "the value of 40 + 2 is " + (40 + 2)

# (40 + 2) returns and integerand needs to be converted to a string for it to be outputed to the screen with the puts method.

# First way is to just chain #to_s onto (40 + 2)
# Another way is to interpolate the 40 + 2 into the string using #{40 + 2}