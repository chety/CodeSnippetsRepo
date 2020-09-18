def format_name(first_name,last_name)
    if !first_name.instance_of?(String) || !last_name.kind_of?(String)
            raise "Arguments must be string"
    end
    
    "#{first_name.capitalize}  #{last_name.capitalize}"    
end

begin
    p format_name("chety","clooney")    
    p format_name("chety",false)
rescue => exception
    p "Oops... " + exception.to_s
end

person = {name:"Chety", language: "Ruby", is_awsome: true, year: 2009}

p person[:name]
person["car"] = "opel"
p person