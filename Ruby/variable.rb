str1 = "boot"
str2 = "boot"
puts str1 == str2 # true
print "str1:",str1.object_id," ,str2:",str2.object_id,"\n" # str1:43156540 ,str2:43156520
str1[3] = "m"
str2.upcase!
print "str1:",str1.object_id," ,str2:",str2.object_id,"\n" # str1:43156540 ,str2:43156520

num1 = 49
num2 = num1
print "num1:",num1.object_id," ,num2:",num2.object_id,"\n" # num1:99 ,num2:99
num1 *= 2
print "num1:",num1.object_id," ,num2:",num2.object_id,"\n" #num1:197 ,num2:99

arr = Array.new(3,"X")
print arr,"\n" # ["X", "X", "X"]

grid = Array.new(3,Array.new(3))
print grid,"\n" # [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

grid[0][0] = "X"

#[["X", nil, nil], ["X", nil, nil], ["X", nil, nil]]. Beware all the first elements chaned !!!
# That is because we are giving Array.new(3) same array as the default value
print grid,"\n" 

tic_tac_toe = Array.new(3) {Array.new(3)}
tic_tac_toe[0][0] = "O"
print tic_tac_toe #[["O", nil, nil], [nil, nil, nil], [nil, nil, nil]]
p -33.abs