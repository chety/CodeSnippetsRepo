#we can create global variable which starts with dollar sign($).
#There is global scope(Variables created with $ or upper case) and  lexical scope which is created by functions in Ruby. 
#Blocks in Ruby do not have a scope. So a variable created inside if/for/while ...etc will still be available to outside.

$message = "Tu Bi Xer hati"
num = 34

# You can not access num inside a function. But Since blocks do not have their own scope, they are part of the place where they are defined.
3.times {p num}


def hello
    #p num  #Error. Even num is defined outside of function, it is not accessible like other languages(C#,Javascript)
    p $message
    #We can even create global variable inside a function
    $globalCreatedInsideFunc = "Global Variable is created inside hello function"

    #this statement is not allowed because each time you call the function, our constant will get a new value even string values are the same
    #each time a new string will be created in different memory locations. You can inspect this by "str".object_id each time to see results
    # HACKER = "Chety Clooney" 

    local_variable = "You can not access this variable from outside of the function"

    
end

hello()
print "outside of func->",$message,"\n"
puts "Out*** " + $globalCreatedInsideFunc
puts $PROGRAM_NAME #This global is provided by Ruby. Also see also $stdout $stdin


Dream = "Be a great hacker"

Dream = "Be a great Engineer" #Got warning(not error!). If it starts with uppercase then it is a constant. You CAN NOT reassign it(Still you can change it)
Dream.sub!("hacker","Engineer") #even it is a constant, you can stil modify it.(Just like const keyword in  Javascript)
puts Dream

name = "Tolaz"
puts name.object_id #43137740
name.replace("Tırşık") #replace will *replace* the value in place. It will not create another string in different memory location
puts name.object_id #43137740