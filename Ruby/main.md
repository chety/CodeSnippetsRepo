```rb
def sum(nums)
  #The last line is automatically returned by Ruby. reduce and inject do the same job
  # nums.inject(0, :+)
  nums.reduce(0) { |sum,num | sum += num }
end

p sum([1,2,3,4,5])
p "-" * 10

def greeting(name,gender="F")
   prefix = gender.upcase == "F" ? "Mrs." :  "Mr."
   "Hello there #{prefix} #{name}"
end


p greeting "Chety", "M" # You do not have to specify paranthesis. But i recommend you to use[When having multiple parameters] for clarification purposes
p greeting("Virgina Wolf", "F") # much better
p "-" * 10

people = ["Joey", "Bex", "Andrew"]
# access last element
p people[people.length - 1]
p people[-1]
p people.last

#access first element
p people.first
p "-" * 10

#do an operation n times
5.times {puts "Chety Clooney is awsome"}
p "-" * 10

#equivalent of every in javascript
numbers = [2,4,6,8]
p numbers.all? { | num | num.even?}

#equivalent of any in javascript
small_nums = [1,2,3,4]
p small_nums.any? { | num | num.odd?}

#true. No element is bigger than 5
p small_nums.none? {|num| num > 5}

#false. It assumes exactly one element  matches criteria. Here 2 and 4 are even not only one element
p small_nums.one? { |num| num.even?}

#return number of element that match criteria. Here it returns 2 (3 and 4 is bigger or equal than 3)
p small_nums.count { |num| num >= 3}

#everything is clear i guess :)
p small_nums.sum

#select specific numbers that match criteria. [2,4]
p small_nums.select { |num| num.even?}

#select min,max
print "Min->",small_nums.min,", Max->",small_nums.max(),"\n"

multi_d = [
  [["a", "b"], "c"],
  [["d"], ["e"]],
  "f"
]
#flat only 1 level. If not specified all the level will be flattened
p multi_d.flatten(1)

p "-" * 10
```
