- To add external behavior to an existing class(Integer,Array,String ...etc) we use `monkey patching`
- In _Javascript_ same behavior is provided by adding methods to `prototypes`. In _C#_ there is a notion called `Extension Methods` which provides similar behaviours

- Let's say we want a method `is_upper?`. Which returns true if word is uppercase, otherwise returns false
```rb
class String
    def is_upper?
        return self.upcase == self
    end    
end

p "chety".is_upper?() #false
p "CHETY".is_upper?() #true
```
- Let's say we want `is_prime?` method with our integers. That will be cool :)
```rb
class Integer
    def is_prime?
        return false if self < 2
        return (2..self/2).none? {|n| self % n == 0 }        
    end    
end

p 2.is_prime?  #true
p 3.is_prime?  #true
p 50.is_prime? #false
```
- Let's add another method to Array class. Our method will check if our even indices contain even value
```rb
class Array
    def is_even_numbers_in_even_indices?
        return false if !self.all?{|n| n.is_a?(Integer)}
        i = 0
        while i < self.length
            return false if self[i].odd?
            i += 2
        end
        return true
    end
end

p [2,1,4,5,6].is_even_numbers_in_even_indices?() #true. (index 0:2, index 2:4,index 4:6)
p [3,7,2,9,10].is_even_numbers_in_even_indices?() #false (index 0: 3 which is not even.)
p [2,"hello",14,false].is_even_numbers_in_even_indices?() #false (all members must be integer)

```

