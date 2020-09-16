```rb
def letter_count(word)
    letters = Hash.new(0)
    return word.each_char.inject(letters) { |acc,curr| acc[curr] += 1; acc }    
end

puts letter_count("cheeetyeet") #{"c"=>1, "h"=>1, "e"=>5, "t"=>2, "y"=>1}
###############################

def custom_product(acc,num)
   acc * num
end 

product =  [11, 7, 2, 4].reduce(1,:*) 
custom_product =  [11, 7, 2, 4].inject(1){|acc,num| custom_product(acc,num)} 
same_product =  [11, 7, 2, 4].reduce(1) { |acc,num| acc *= num } 

print product," # ",custom_product," # ",same_product,"\n"
###############################

min_1 = [11, 7, 2, 4].min
min_2 = [11, 7, 2, 4].reduce { |acc,num| num < acc ? num : acc}
print min_1," ",min_2,"\n"

sum_of_evens = [11, 7, 2, 4,12].inject(0) { |acc,num| acc += num.even? ? num : 0 }
puts sum_of_evens
###############################
```
