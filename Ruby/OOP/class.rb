class Person

    #only setter prop
    attr_writer :age

    #only getter prop
    attr_reader :gender

    #both getter and setter
    attr_accessor :team

    def initialize(fullname,age,gender,team)
        @fullname = fullname
        @age = age
        @gender = gender        
        @team = team
    end

    #getter-1
    def fullname
        @fullname
    end
    #setter-1
    def fullname=(fullname)
        @fullname = fullname
    end

    def to_s
        return "Hi My name is #{@fullname}. I am #{@age} years old. A strong fan of #{@team}"
    end
end


person = Person.new("Chety Clooney",20,"M","Barça")
p person

person.fullname = "Daniel Amokachi"
p person.fullname

person.age = 44
p person

#person.gender = "F" # no setter for gender attribute. Will raise an error
p person.gender

person.team = "Sport De La Mushe"
p person.team
puts person #will automatically call to_s method.