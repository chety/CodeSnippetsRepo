#module lets you define your constants,methods ...etc. And then you can use this module whereever you want
#For example Math is a module in ruby
#print Math::PI," ", Math.sqrt(9),"\n"

module MathProcessor
    def sum(num1,num2)
        num1 + num2
    end

    def average_of_numbers(numbers)
        if numbers.nil? || numbers.size == 0
            raise "Numbers must be provided"
        end
        return numbers.sum / numbers.length
    end
    
end

class CustomMath
    include MathProcessor
end

math = CustomMath.new
p math.sum(3,2)
p math.average_of_numbers([1,2,3,4,5])
