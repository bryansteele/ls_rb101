# Input: 1 string & 1 integer
# Output: String - 1 or more times
#                - the number of times the string is printed to the screen it the 
#                  number given as an argument.


def repeat(string, integer)
    integer.times { puts string }
end




repeat('Hello', 3)

# Hello
# Hello
# Hello