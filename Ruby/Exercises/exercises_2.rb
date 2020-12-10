def duos(str)
    count = 0
    (0...str.length - 1).each do |i|
        count += 1 if str[i] == str[i + 1]
    end
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sentence,hash)
    # sentence.split(/\s+/).map do |word|
    #     hash[word] || word
    # end.join(" ")

    sentence.split(/\s+/).inject("") do |result,word|
        result += hash.fetch(word,word) + " "
    end.strip

end  

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash,proc_1,&proc_2)
    result_hash = {}
    hash.each do |k,v|
        new_key = proc_2.call(k)
        new_value = proc_1.call(v)
        result_hash[new_key] = new_value
    end
    result_hash    
end

def counted_characters(str)
    hash = Hash.new(0)
    str.each_char {|ch| hash[ch] += 1}
    hash.select {|ch,count| count > 2}.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true?(str)
    (0...str.length - 2).any? do |i|
        str[i..i+2] == str[i] * 3
    end
end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

def energetic_encoding(str,hash)
    # hash[" "] = " "
    str.each_char.inject("") do |result,ch|
        # result += hash[ch] || "?"
        result += hash[ch]  || (ch == " " ? " " : "?")
    end 
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
    result = ""
    i = 0
    while i < str.length - 1
        letter = str[i]
        count = str[i+ 1].to_i
        result += letter * count
        i += 2
    end
    result
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr,*procs)
    arr.select do |el|
        procs.all? {|proc| proc.call(el)}
    end
end

def conjunct_select2(arr,*procs)
    procs.inject(arr) {|acc,proc| acc.select(&proc)}
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }
# p conjunct_select2([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select2([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select2([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin2(sentence)
    vowels = "aeiou"
    sentence.split(" ").inject("") do |result,word|
        inner_word = "" 
        if word.length < 3
            inner_word = word
        else
            if vowels.include?(word[0].downcase)
                inner_word = word + "yay"
            else
                first_vowel_idx = word.index(/[aeiou]/)
                inner_word = word[first_vowel_idx..-1] + word[0...first_vowel_idx] + "ay"
                if inner_word.downcase != inner_word
                    inner_word = inner_word.downcase.capitalize
                end
            end
        end
        result += result == "" ?  inner_word : " " + inner_word 
    end
end

def convert_word(word)
    vowels = "AEIOUaeiou"
    return word + "yay" if vowels.include?(word[0])
    word.each_char.with_index do |ch,i|
        if vowels.include?(ch)
            return word[i..-1] + word[0...i] + "ay"
        end
    end
    word
end

def convert_pig_latin(sentence)
    words = sentence.split(" ")
    words.map do |word|
        new_word = word.length < 3 ? word : convert_word(word)
        word == word.capitalize ? new_word.capitalize : new_word
    end.join(" ")
end 

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"


def last_indef_of_vowel(str)
    vowels = "aeiou"
    str.reverse.each_char.with_index do |ch,i|
        return str.length - i - 1 if vowels.include?(ch)
    end
end


def reverberate(sentence)
    vowels = "aeiou"
    sentence.split(/\s+/).inject("") do |result,word|
        inner_word = ""
        if word.length < 3
            inner_word = word
        else
            if vowels.include?(word[-1])    
                inner_word = word + word.downcase
            else
                last_idx = last_indef_of_vowel(word)
                inner_word = word + word[last_idx..-1]
            end
        end
        result += inner_word + " "
    end.strip
end


def disjunct_select(arr,*procs)
    arr.select do |el|
        procs.any? {|proc| proc.call(el)}
    end
end

def word_without_index(word,idx)
    word[0...idx] + word[idx + 1..-1]
end

def alternating_vowel(sentence)
    vowels = "aeiou"
    result = ""
    sentence.split(/\s+/).each_with_index do |word,idx|
        inner_word = ""
        if word.scan(/[aeiou]/).length == 0
            inner_word = word
        else
            if idx % 2 == 0
                first_vowel_idx = word.index(/[aeiou]/)
                inner_word = word_without_index(word,first_vowel_idx)
            else
                last_vowel_idx = last_indef_of_vowel(word)
                inner_word = word_without_index(word,last_vowel_idx)
            end
        end 
        result += inner_word + " "
    end
    return result.strip
end

def silly_talk(sentence)
    vowels = "aeiou"
    sentence.split(/\s+/).inject("") do |result,word|
        inner_word = ""
        if vowels.include?(word[-1])
            inner_word = word + word[-1]
        else
            inner_word = word.each_char.inject("") do |new_word,ch|
                new_word += vowels.include?(ch.downcase) ? "#{ch}b#{ch.downcase}" : ch
            end
        end
        result += inner_word + " "
    end.strip
end

def write_char_with_count(ch,count)
    "#{ch}#{count == 1 ? "" : count.to_s}"
end

def compress(word)
    count = 1
    result = ""
    previous_char = word[0]
    (1..word.length - 1).each do |i|
        if word[i] == previous_char
            count += 1
        else
            result += write_char_with_count(previous_char,count)
            count = 1
            previous_char = word[i]
        end
    end
    result += write_char_with_count(previous_char,count)
    result
end

