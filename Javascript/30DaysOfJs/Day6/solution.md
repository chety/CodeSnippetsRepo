### Day-6 Level-2 solutions

1- Develop a small script which generate any number of characters random id:
***
**My Solution**
```javascript
function createRandomBetween(min,max){
    const randomNum = Math.floor(Math.random() * (max - min + 1)  + min);
    return randomNum;
}
function createRandomPassword(length,max,min){
     const randomCharCodes = [];   
     for(let i = 0 ; i<length;i++){
        randomCharCodes.push(createRandomBetween(max,min));
     }
    console.log("codes *",randomCharCodes)
    return randomCharCodes.map(n => String.fromCharCode(n)).join("")
}

//48 -> 0, 122 -> z. Create a ten length password from  0 to z
createRandomPassword(10,122,48); // "7GlMh@pvp:"
```
