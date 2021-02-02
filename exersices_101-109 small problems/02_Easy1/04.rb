# Write a method that counts the number of occurrences of each element in a given array.

# input: 1 array of strings
# output: hash - vehical type as key, and the number of occurenses in array as the values.

# 

vehicles = [
    'car', 'car', 'truck', 'Car', 'SuV', 'truCk',
    'moTorcycle', 'motorcYcle', 'car', 'Truck'
]

def count_occurrences(vehicle_list)
  occurenses_hsh = {}
  
  downcase_list = vehicle_list.map do |x|
                    x.downcase
                  end

  downcase_list.uniq.each do |i|
    occurenses_hsh[i] = downcase_list.count(i)
  end

  occurenses_hsh.each do |k, v|
    puts "#{k} => #{v}"
  end
end

count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2