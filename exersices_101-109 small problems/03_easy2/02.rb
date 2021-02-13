SQINCHES_TO_SQFEET = 144
SQINCHES_TO_SQCENT = 6.4516
SQFEET_TO_SQMETER = 0.092903

puts "=> Enter the length of the room in feet:"
length = gets.to_f

puts "=> Enter the width of the room in feet:"
width = gets.to_f

sq_feet = length * width
sq_meters = sq_feet * SQFEET_TO_SQMETER
sq_inches = sq_feet * SQINCHES_TO_SQFEET
sq_centimeters = sq_inches * SQINCHES_TO_SQCENT

puts "=> The area of the room is #{sq_feet.round(2)} sq feet \
- (#{sq_meters.round(2)} sq meters) \n
=> #{sq_inches.round(2)} sq inches \n
=> #{sq_centimeters.round(2)} sq centimeters"