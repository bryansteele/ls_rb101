ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# delete key/value pair if values > 100

ages.delete_if {|_, age| age > 100 }

p ages




# ages.keep_if { |_, age| age < 100 }