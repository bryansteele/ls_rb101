flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# input: array
# output: hash

# rules: 
# - the values of the array elements become the keys to the hash
# - hash values will be the array position of each name
#     - { "Fred" => 1, "Barney" => 2 ....}
# Does position in the array mean index or 1st, 2nd, 3rd, etc?

# Below I am adding 1 to the index to make it in the 1st, 2nd. 3rd .... instead of position 0, 1, 2, 3... 


hash = {}
flintstones.each_with_index do |name, idx|
  hash[name] = idx + 1
end

p hash
p flintstones