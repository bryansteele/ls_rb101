# Write a method that counts the number of occurrences of each element in a given array.

# input: 1 array of strings
# output: hash - vehical type as key, and the number of occurenses in array as the values.

# 

vehicles = [
    'car', 'car', 'truck', 'car', 'SUV', 'truck',
    'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(vehicle_list)
  vehicle_occurrences = {}
  
  vehicle_list.uniq.each do |vehicle|
    vehicle_occurrences[vehicle] = vehicle_list.count(vehicle)
  end

  vehicle_occurrences.each do |k, v|
    puts "#{k} => #{v}"
  end
end

count_occurrences(vehicles)


# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2