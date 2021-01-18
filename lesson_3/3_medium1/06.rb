answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# 34 --- the answer variable is passed in as an argument to the method definition and assigned to the local variable some_number. some_number is re-assigned to 50, but that does nothing to the answervariable in the outer scope. Therefore line 9 outputs the value of 42 - 8, which is 34.