```rb
class Cat

    #If our variable starts with an uppercase then it is a constant. You can not change it later
    Constant_Cat_State = "Cute"

    #static variable. Share by all the instances of the Cat class(Denoted by @@ symbol)
    @@farm_name = "Animal Farm By George Orwell"

    attr_accessor :name,:color,:age


    def initialize(name,color,age)
        @name = name
        @color = color
        @age = age
    end

    def purr
        # Constant_Cat_State = "Ugly". It gives error because our variable is a constant
        puts Constant_Cat_State
        puts("#{@name} is purring with #{@color} color")
    end

    def farm_name
        @@farm_name
    end

    #static method. Only accessible by Class itself. Not instances(Static methods start with "self.")
    def self.change_farm_name(value)
        @@farm_name = value
    end

    def to_s
        "Name: #{@name}, Color: #{@color}, Age: #{@age}"
    end
end
```
***
```rb
cat_1 = Cat.new("Muxlis","yellow",5)
p cat_1
cat_1.purr
cat_1.name = "Elican"
cat_1.color = "Reşşik"
cat_1.age=(55)
p cat_1
p cat_1.farm_name
Cat.change_farm_name("Brave New World")
p cat_1.farm_name
```
