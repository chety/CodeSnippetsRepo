### Day-2 -  Level-3 Problem Solutions

- Create  random number patterns between specified start and stop then write it to the console.
```javascript
function createRandomInterval(start,stop){
    return Math.floor(Math.random() * (stop - start + 1)) + start
}

function write(start,stop){
    let generatedNumbers = [], str = "";
    for(let i = 0 ; i< 5; i++){
        for(let k = 0; k<5;k++){
            const rand = createRandomInterval(start,stop);
            str += rand + " ";
        }
        generatedNumbers.push(str.trim());
        str = "";
    }
    return generatedNumbers;
}
 write(1,8);
 /*
   1 3 8 4 5
   3 3 4 5 1
   7 1 5 6 2
   8 7 1 3 4
   1 4 5 6 7
 */
```
- Randomly access to the characters of the given string.

```javascript
function accessAsRandom(str){
    let i = 0, len = str.length, tryCount = 0;
    const result = [];
    while(true){
        tryCount++;
        const rand = Math.floor(Math.random() * len);
        if(rand === i){
            result.push(str[i]);            
            i++;            
        }
        if(result.length === len){
            console.log(`Number of tries: ${tryCount}`);
            break;
        }        
    }
    console.log(`Result -> ${result.join('')}`)
}

console.log(accessAsRandom("Chety"));
//Number Of tries: 120
//Result -> Chety
```
- Find maximum occurance word in a given broken sentence.
```javascript
function maxWordAndCount(sentence){
    const cleanSentence = sentence.replace(/[^0-9a-zA-Z\s]+/g,"");
    const processedWords = Object.create(null);
    return cleanSentence.split(" ").reduce((acc,curr) => {       
         if(curr in processedWords){
            return acc;
         }
         processedWords[curr] = true;
         if(acc.value === curr){
            return acc;
        }
         const regexObj = new RegExp(`\\b${curr}\\b`,"gm");
         const count = cleanSentence.match(regexObj).length;
         if(count > acc.count){
            acc.count = count;
            acc.value = curr;
         }    
   return acc;
    },{value:"",count:0})
}
const sentence =  `%I $am@% a %tea@cher%, &and& I lo%#ve %te@a@ching%;. The@re $is no@th@ing; 
&as& mo@re rewarding as educa@ting &and& @emp%o@weri@ng peo@ple. ;
I found tea@ching m%o@re interesting tha@n any ot#her %jo@bs. %Do@es thi%s mo@tiv#ate yo@u
to be a tea@cher!? %Th#is 30#Days&OfJavaScript &is al@so $the $resu@lt of &love& of tea&ching`;

maxWordAndCount(sentence);//{value: "I", count: 3}
```

- Calculate the total annual income of the person by extract the numbers from the following text. 
```javascript
const totalIncome = msg => msg.match(/\d+/gm).map(Number).reduce((acc,curr) => acc + curr, 0)
const message = `He earns 5000 euro from salary per month, 10000 euro annual bonus,
15000 euro online courses per month.`

totalIncome(message) ; //30000
```
