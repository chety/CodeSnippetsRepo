> Level-2 solutions

- Quadratic equation is calculated as follows: ax2 + bx + c = 0. Write a function which calculates value or values of a quadratic equation, solveQuadEquation.
```javascript
function solveQuadratic(a,b,c){
   if(c === 0){
        return {val1: b, val2: 0}
   }
   let divisorsOfC = Object.create(null);   
   for(let i = 1; i<= Math.abs(c);i++){
        if(c % i === 0){
          divisorsOfC[i] = c / i;  
        }
   }
   
   for(const [key,value] of Object.entries( divisorsOfC)){        
        if(Number(key) + value === b){
            return {val1:Number(key),val2:value};
        }
    }
    
    return {};
}
```
- Write a function name showDateTime which shows time in this format: 08/01/2020 04:08 using the Date object.
```javascript
const options = {
  year: 'numeric', month: 'numeric', day: 'numeric',
  hour: 'numeric', minute: 'numeric',
  hour12: false
};
new Intl.DateTimeFormat("en-GB",options).format(new Date()); //-> "05/06/2020, 14:18"
```
- Write a function which generates a randomUserIp.
```javascript
function randomUserIp(){
    let ip = "";
    const regEx = /\d+\.\d+\.\d+\./gi;
    while(!regEx.test(ip)){
       if(ip.length > 0){
            ip += ".";
        }       
       ip +=   Math.floor(Math.random() * 256);   
    }
    return ip; 
}
```
- Write a function which generates a randomMacAddress
```javascript
function createDataset(){
    let alphabet = "0123456789";
    for(let i = 65; i<=90;i++){
      alphabet += String.fromCharCode(i);
    }
    return alphabet;
}

function randomMacAddres(){
    //39-15-AD-G0-EQ-AL
    const alphabet = createDataset();
    const macRegEx = /\w{2}\-\w{2}\-\w{2}\-\w{2}\-\w{2}\-/gi
    let macAddress = "";
    while(!macRegEx.test(macAddress)){
      if(macAddress.length > 0){
            macAddress += "-";
      }
      let i = 0;
      while(i++ < 2){
            macAddress += alphabet[Math.floor(Math.random() * alphabet.length)];
      }
    }
    return macAddress;
}
```
***
### Level-3 Solutions


