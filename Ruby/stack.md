> Stack is a Last In First Out data structure(**LIFO**). We can use this ds in many ways. 

```rb
PARENS = {
	"(" => ")",
	"{" => "}",
	"[" => "]"
}
OPENING_PARENS = PARENS.keys
CLOSING_PARENS = PARENS.values

def isValidMathString(mathExpression)
	stack = []
	mathExpression.each_char do |char|
		if OPENING_PARENS.include?(char)
			stack << char
		elsif CLOSING_PARENS.include?(char)
			PARENS[stack.last] == char ? stack.pop() : (return false)
		end
	end
	return stack.empty?
end

p isValidMathString("3 + (5 * 4 + [9 + 3 - {1 + 1])") #false
```
