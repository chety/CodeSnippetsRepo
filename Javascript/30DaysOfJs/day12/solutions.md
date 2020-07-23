### level-2
- Write a function called `mostFrequentWords` which get the  most frequent word from a string?
```javascript

function mostFrequentWords(sentence,count = 10){
    const words = [...new Set(sentence.replace(/\./g,"").split(/\s+/))]
    const wordCountStore =  words.map(word => {
        const regex = new RegExp(`\\b${word}\\b`,"g");
        const matches = sentence.match(regex)
        return {
            word,
            count: matches ? matches.length : 0
        }
    })
    wordCountStore.sort((w1,w2) =>  w2.count - w1.count );
    return wordCountStore.slice(0,count);
}
```
```javascript
const const paragraph = `I love teaching. If you do not love teaching what else can you love. I love Python if you do not love something
which can give you all the capabilities to develop an application what else can you love.`;

mostFrequentWords(paragraph,3);  
[
  {word: "love", count: 6}
  {word: "you", count: 5}
  {word: "I", count: 3}
]
```

###Level 3
- Write a function which cleans text. Clean the following text. After cleaning, count three most frequent words in the string.
```javascript
function cleanText(sentence){
    return sentence.replace(/[^a-zA-Z\d\s\.?]/g,"")
}
```
```javascript
const sentence = `%I $am@% a %tea@cher%, &and& I lo%#ve %tea@ching%;. There $is nothing; &as& mo@re rewarding as educa@ting &and&
@emp%o@wering peo@ple. ;I found tea@ching m%o@re interesting tha@n any other %jo@bs. %Do@es thi%s mo@tivate yo@u to be a tea@cher!?`

mostFrequentWords(cleanText(sentence),3);
[
  {word: "I", count: 3}
  {word: "a", count: 2}
  {word: "teacher", count: 2}
]

```
