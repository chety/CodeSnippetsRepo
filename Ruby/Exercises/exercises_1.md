```rb
def no_dupes(arr)
    arr.select {|num| arr.count(num) == 1}    
end

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i + 1]
    end
    return true
end

def char_indices(str)
    hash = Hash.new {|h,k| h[k] = []}
    (0..str.length - 1).each do |i|
        hash[str[i]] << i
    end
    hash
end

def longest_streak(str)
    words = str.scan(/(\w)(\1*)/).map(&:join)
    words.inject("") do |longest_word,word|
        longest_word = word if word.length >= longest_word.length        
        longest_word
    end
end

# p longest_streak("aabbbbcccc")

def longest_streak2(str)
    best_streak = ''
    current_streak = ''
    (0..str.length - 1).each do |idx|
        if str[idx] == str[idx - 1] || idx == 0
            current_streak += str[idx]            
        else
            current_streak = str[idx]
        end
        best_streak = current_streak if current_streak.length >= best_streak.length
    end
    best_streak
end

def is_prime?(num)
    (2..num/2).each do |factor|
        return false if num % factor == 0
    end
    return true
end

def bi_prime?(num)
    (2..num/2).each do |factor|
        if num % factor == 0 && is_prime?(factor)
            factor_2 = num / factor
            return true if is_prime?(factor_2)
        end
    end
    return false
end

def vigenere_cipher(message, keys)
    alphabet = ("a".."z").to_a
    secret = ""
    message.each_char.with_index do |char,i|
        char_index = alphabet.index(char)
        rotate_index = keys[i % keys.length]
        secret_index = (char_index + rotate_index) % alphabet.length
        secret += alphabet[secret_index]
    end
    return secret
end

def vowel_rotate(word)
    vowels = "aeiou"
    last_index = nil
    secret = ""
    word.each_char.with_index do |char,i|
        if vowels.include?(char)
            if last_index.nil?
                secret += char
            else
                secret += word[last_index]            
            end
            last_index = i
        else
            secret += char
        end
    end
    
    secret.sub!(/[aeiou]/, word[last_index])
    return secret
end

def vowel_rotate2(word)
    vowels = "aeiou"
    vowel_indexes = (0..word.length - 1).select {|i| i if vowels.include?(word[i])}
    rotated_vowel_indexes = vowel_indexes.rotate(-1)
    str = word[0..-1]
    vowel_indexes.each.with_index do |vowel_index,i|
        new_char = word[rotated_vowel_indexes[i]]
        str[vowel_index] = new_char
    end
    str
end


class String

    def select(&prc)
        # prc ||= Proc.new {|ch| ch != ch}
        return "" if prc.nil?
        result = ""
        self.each_char do |ch|
            result += ch if prc.call(ch)
        end
        result
    end

    def map!(&prc)
        result = self
        self.each_char.with_index do |ch,i|
            result[i] = prc.call(ch,i)
        end
        result        
    end
    
end

def multiply(a, b) #no loop, no * operator, use recursion    
    def inner(num,times)
        if times == 1
            return num
        end
        num + inner(num, times - 1)
    end
    times_negative = b < 0
    result = inner(a,times_negative ? b * -1 : b)
    times_negative ? result * -1 : result
end

def multiply2(num,times)
    return 0 if times == 0
    if times < 0
        return -(num +  multiply2(num,(-times) - 1)) 
    else
        return num + multiply2(num,times - 1)
    end
end



def lucas_sequence(length)
    def inner(numbers,length)
        if numbers.length >= length
            return numbers[0...length]
        end
        new_numbers = numbers << (numbers[-1] + numbers[-2])
        inner(new_numbers,length)
    end
    lucas_numbers = [2,1]
    return inner(lucas_numbers,length)    
end

def lucas_sequence2(length)
    return [] if length == 0
    return [2] if length == 1
    return [2,1] if length == 2
    seq = lucas_sequence2(length - 1)
    seq << seq[-1] + seq[-2]
    seq
end




def prime_factorization(num)
    if is_prime?(num)
        return [num]
    end

    def inner(num,factor)
        result = []
        if num == 1
            return result
        end
        if num % factor == 0 && is_prime?(factor)
            result << factor
            result += inner(num / factor, factor)
        else
            result += inner(num, factor + 1)
        end
        result
    end
    
    inner(num,2)
end

def prime_factorization2(num)
    (2...num).each do |factor|
        if num % factor == 0
            other_factor = num / factor
            return [*prime_factorization2(factor), *prime_factorization2(other_factor)]
        end
    end
    [num]
end

p prime_factorization2(11)


```
