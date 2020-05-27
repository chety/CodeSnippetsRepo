### Write a `bind` function pollyfill.

> If you curios about `pollyfill vs. transpiling` see my lecture note https://github.com/chety/Interview/blob/master/Javascript/pollyfillAndTranspile.md

```javascript
Function.prototype.customBind = function(obj,...args1){
   const func = this;
   return function(...args2){
        func.apply(obj,args1.concat(args2));
    }
}

//usage
const person = {
    firstName: "Aziz",
    lastName: "Koçber"
}

function writeInfo(){
    console.log(`Hello there, my name is ${this.firstName} ${this.lastName}`);
    console.log(`Also taking extra arguments -> ${arguments}`);
}

const customBind = writeInfo.customBind(person,1,"hi",false);
customBind({},[1,2,3], undefined,null);
/*
Hello there, my name is Aziz Koçber
Also taking extra arguments ->  Arguments(7) [1, "hi", false, {…}, Array(3), undefined, null]
*/
```
