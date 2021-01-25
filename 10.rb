[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# => [1, nil, nil] --- Because the puts is invoked on the last line of the if statement, that will return nil.Therefore, 1st iteration if went to the else and returned num which is 1. the next 2 iterations the puts method is the evaluation, so nil is returned 2 times.
