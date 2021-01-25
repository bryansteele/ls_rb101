ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.reduce { |sum, age| sum + age }

# # total_ages = 0
# ages.each { |_,age| total_ages += age }
# total_ages # => 


# ages.values.inject(:+) # => 6174