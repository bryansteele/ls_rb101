arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map do |sub|
  sub.sort do |a, b|
    b <=> a
  end
end