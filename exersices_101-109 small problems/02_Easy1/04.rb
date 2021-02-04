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