class Car

    #both getter and setter
    attr_accessor :type,:model, :name

    def initialize(type,model,name,max_velocity)
        @type = type
        @model = model
        @name =  name
        @max_velocity = max_velocity
    end

    def to_s
        "Type: #{@type} Model: #{@model} Name: #{@name}"  
    end

end

#inheritance. We are inheriting from Car class
class ElectricCar < Car
    attr_reader :battery
    
    def initialize(type,model,name,max_velocity,battery)
        @battery = 12
        super(type,model,name,max_velocity)
    end

end

tesla = ElectricCar.new("Electric","Tesla-3","Tiger",250,12)
puts tesla #Type: Electric Model: Tesla-3 Name: Tiger
puts tesla.battery
print tesla.type," - ",tesla.model," - ", tesla.name,"\n"