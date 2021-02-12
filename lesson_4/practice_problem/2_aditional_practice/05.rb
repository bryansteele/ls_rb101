flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index { |name, idx| puts idx if name.start_with?('Be')}

# flintstones.index { |name| name[0, 2] == "Be" }