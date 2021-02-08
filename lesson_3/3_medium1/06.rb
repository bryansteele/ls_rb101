answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# 32, because the re-assignment inside the method definition does not change the value of the local variable in the outer scope.