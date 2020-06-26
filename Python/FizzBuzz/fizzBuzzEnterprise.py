def fizzBuzz1():
    for i in range(1,101):
        if i % 3 == 0 and i % 5 == 0:
            print("FizzBuzz")
        elif i % 3 == 0:
            print("Fizz")
        elif i % 5 == 0:
            print("Buzz")
        else:
            print(i)
#fizzBuzz1()
def fizzBuzz2():
    for i in range(1,101):
        output = ""
        if i % 3 == 0:
            output += "Fizz"
        if i % 5 == 0:
            output += "Buzz"
        print(output or i)
#fizzBuzz2();

def fizzBuzz3():
    for i in range(1,101):
        output = "Fizz" if i % 3 == 0 else ""
        output += "Buzz" if i % 5 == 0 else ""
        print(output or i)
        

#fizzBuzz3()     

def fizzBuzz4():
    for i in range(1,101):
        output = "Fizz" * (i % 3 < 1)
        output += "Buzz" * (i % 5 < 1)
        print(output or i)
fizzBuzz4()
