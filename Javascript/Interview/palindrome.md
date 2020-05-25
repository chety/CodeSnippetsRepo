- Write a method that checks if a string is palindrome. 
- Punctuation and space does not matter. (Just ignore them)
- Lower and upper case does not matter. (Both 'A' and 'a' is same)
- Empty string or 1 length string should return true

`Expected Results`
- "ey Edip !'^ adanAda pide %&/ ye." -> `true`
- "!A,ba" -> `true`
***
```javascript
function isPalindrome(word){
    if(word == null){
        return false;
    }
    if(word.length <= 1){
        return true;
    }
    let internalWord = word.match(/[a-zA-Z]+/gi);
    if(!internalWord || internalWord.length === 0){
        return false;
    }
    internalWord = internalWord.join("").toLowerCase();
    const length = Math.floor(internalWord.length / 2);
    for(let i =0 ; i<length; i++){
        if(internalWord[i] !== internalWord[internalWord.length - i - 1]){
            return false;
        }
    }
    return true;
}
```
