#symbols are used for constants. Symbol value does not change durungi program
#Strings in ruby is mutable(can be changed) that means every change to them will be stored in different section of memory
#Symbols are immutable. They do not change during our program, and always are kept in the same memory location

name = "Chety"
name_symbol = :Chety

print name," ",name_symbol,"\n"
p name.length,name_symbol.length
p name == name_symbol #false

#object_id method gives memory location of the object
print "Chety".object_id," ","Chety".object_id," ","Chety".object_id,"\n" #strings are stored in diffent addresses even their values are equal
print :Chety.object_id," ",:Chety.object_id," ",:Chety.object_id, "\n" #since symbols are immutable, there is only one symbol instance at the same location
#############################

lang = {:name => "C", :inventor => "Dennis Ritchie", :year => 1970}
p lang
p lang[:inventor]

#if we use symbol as has key there is also a shortcut. We can get rid of the "=>" rocket.
hacker = {name:"Chety", type:"White hat hacker", age: 30, isAwsome: true}
p hacker #notice output. Keys are symbols. -< {:name=>"Chety", :type=>"White hat hacker", :age=>30, :isAwsome=>true}
p hacker[:name] #notice to access value i write ":name". Colon is required

#############################
def repeat(name,times= 1)
    name * times
end

p repeat("chety")
p repeat("amokachi ",4)
#############################
def greeting(name1,name2 = nil)
    if name2.nil?
        "Hello to you #{name1}"
    else
        "Hi to all #{name1} and #{name2}"
    end
end

p greeting("Richard")
p greeting("Richard","Stallman")
#############################

#to avoid confussion, optional parameters must come at the end of the parameters
def favourite(team,player="Messi")
    "#{team} is a great time with this incredible player -> #{player}\n"
end

print favourite("Barça")
#############################
#if you have a hash as parameter, when passing it as an argument we can omit curly braces `{}`
def print_hash(hash)
    p hash
end

user = {name: "Chety", surname: "Clooney", occupation: "Hacker"}

print_hash({name: "Chety", surname: "Clooney", occupation: "Hacker"})
print_hash(name: "Chety", surname: "Clooney", occupation: "Hacker")

def write_name(name,options = {upper:false,times:1})
    name.upcase! if options[:upper] == true
    name * options[:times]
end
# options = {:upper => true, :times => 3} [is same as] options = {upper:true,times:3}
# We are using symbols as keys of the hash. Symbols are much more convenient and fast when using as keys in hash.
p write_name("zilx") # "zilx"
p write_name("mirko ",{times:2}) #"mirko mirko "
p write_name("rodik ",upper:true,times:3) #"RODIK RODIK RODIK "
