require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)


# -4712-01-01
# 2016-01-01
# 2016-05-01
# 2016-05-13

# https://docs.ruby-lang.org/en/3.0.0/Date.html?search=Date.civil#
# States that the defaults for year=14712, month=1, day=1 
# Since the first line we puts to the screen had no arguments, the defaults printed out. The same for the other 3. Where we didn't have input, the program used the defaults.