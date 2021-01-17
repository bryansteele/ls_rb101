advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!(0..38)

p advice

# I we used #slice, the method would only use a copy of the variable advice and then the return value for the variable advice would still be the complete sentence string.

# or
# advice.slice!(0, advice.index('house'))