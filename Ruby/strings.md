### Here are some code snippets that i wrote during learning awsome language Ruby

```rb

def vowel_cipher(string)	
	vowels = {
		"a" => "e",
		"e" => "i",
		"i" => "o",
		"o" => "u",
		"u" => "a",
	}
	result =  string.gsub(/[aeiou]/,vowels)
	return result
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap
```



