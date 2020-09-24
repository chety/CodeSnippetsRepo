- In _javascript_ **we can assign functions to variables.** But in _Ruby_ it is not possible directly. Instead we can create `Proc` objects to achieve similar behaviors.
- We can think a Proc is a _wrapper_ around a block of code
```rb
#You can not directly assing a BLOCK to a variable. It is a syntax error
#doubler_0 = { |num| num * 2 } # SyntaxError: unexpected '}'

doubler = Proc.new { |num| num * 2}
p doubler  #<Proc:0x000000000512ef8
p doubler.call(5) #10
p "-" * 30
```

- In javascript we can pass functions to another functions as arguments but in ruby it is not directly achievable. But we can try :)
```rb
def sum_and_proc(num1,num2,proc)
    sum = num1 + num2
    proc.call(sum)
end

square = Proc.new {|num| num * num}
p sum_and_proc(3,4,square) # 49

add10 = Proc.new { |num| num + 10}
p sum_and_proc(4,6,add10) # 20
```

- Every time you want to pass we have to create a proc via `Proc.new`. But we can get rid of this convention via ***'&'*** operator. 
**Which basically converts a block to a proc or proc to block**
```rb
#Here we have &proc. That means we will pass a 'BLOCK' to funcion when called, and our function will convert this block to a 'PROC' via '&' operator
def multiply_and_proc(num1,num2,&proc)
    multi = num1 * num2
    proc.call(multi)
end

#here we are passing a block at the end. It will be converted to a Proc by func itself via '&'
p multiply_and_proc(6,7) {|n| n * -1} #-42

#'&' is also used to convert from Proc to block(Both way works)
double_and_negate = Proc.new {|i| i * 2 * -1}

#Here we say convert PROC to BLOCK and pass to the func. In func AGAIN this BLOCK will be
#converted to PROC. There will be 2 conversion in this case
p multiply_and_proc(8,9,&double_and_negate) #-144
p "-" * 30
```
- We can create our `Proc` and pass it to higher order functions(map,filter,reduce ...etc)
```rb
duplicate_name = Proc.new { |name| name * 3}
names = ["Mirko","Rodik","Chety"]
#map is expecting a 'BLOCK'. to convert from Proc -> Block we use & operator
p names.map(&duplicate_name)
```



