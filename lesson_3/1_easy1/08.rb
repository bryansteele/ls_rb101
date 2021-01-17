flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones = flintstones.to_a.delete_if { |e| e[0] != 'Barney' }

puts flintstones


# flintstones.assoc('Barney')