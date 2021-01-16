vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(vehicle_array)
  occurrences = {}

  vehicle_array.uniq.each do |x|
    occurrences[x] = vehicle_array.count(x)
  end

  occurrences.each do |k, v|
    puts("#{k} => #{v}")
  end
end

count_occurrences(vehicles)