flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# if element starts with 'Be'  print index of 1st name

p flintstones.bsearch_index {|name| name.start_with?('Be') }

# p flintstones.index { |name| name[0, 2] == "Be" }