puts "=> What is the bill?"
bill_minus_tip = gets.to_f

puts "=> What is the tip percentage?"
tip_percent = gets.to_f

tip = bill_minus_tip * (tip_percent / 100)
total = (bill_minus_tip + tip)

puts "=> The tip is %0.2f \n=> The total is %0.2f" % [tip, total]