#splat opearator (*) is very useful for variadic parameters,unpacking arrays ...etc. It is same as javascript rest operator which is (...)

#we can use splat to get remaning parameters(like rest parameters in javascript)
def person_info(name,surname,*qualifications)
    puts "Hello there #{name} #{surname}. You have below skills"
    qualifications.each {|q| print q," "}
    puts
end

person_info("chety","clooney","javascript","ruby","python","csharp","java")
puts "###################################"

def lecture_info(name,department,start_day,duration)
    puts "#{name} class will be helded in #{department} building in #{start_day} days and last #{duration} month(s)"
end

lecture = ["Advanced Ruby","Computer Science", 2,1]
lecture_info(*lecture) #spread all the array values as comma separeted to the method
puts "###################################"

#we can also spread hash values via double splat operator(**). But our hash keys must be implemented via symbols
standart_user = {awsome:false,age:32,department:"Computer Science"}
super_user = {**standart_user, awsome:true,name:"Chety Clooney"} #get all standart_user values and define other properties.
puts super_user

first,second,*rest = [1,2,3,4,5,6]
print first," - ",second," - ",rest, "\n" #1 - 2 - [3, 4, 5, 6]