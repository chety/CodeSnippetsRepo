## Level 2 Questions
**countries data** -> https://github.com/Asabeneh/30DaysOfJavaScript/blob/master/09_Day/09_day_starter/data/countries_data.js

4. Create a function which return an array of objects, which is the letter and the number of times the letter use to start with a name of a country.

```javascript
function getValueOrDefault(obj,prop,defaultVal){
    if(Object.prototype.hasOwnProperty.call(obj,prop)){
        return obj[prop];
    }
    return defaultVal;
}

countries.reduce((acc,curr) => {
    const firstChar = curr.name[0].toLocaleLowerCase();
    acc[firstChar] = getValueOrDefault(acc,firstChar,0) + 1;
    return acc;
},{})
```
5. Declare a **getFirstTenCountries** function and return an array of ten countries. Use different functional programming to work on the countries.js array

```javascript
function getFirstTenCountries(countries){
    // 1.Way
    //return countries.slice(0,10)
    
    //2.way
    //return countries.filter((_,i) => {
    //    return i <10;
    //})
    
    //3.Way
    const copyCountries = countries.slice();
    copyCountries.splice(10,copyCountries.length - 10);
    return copyCountries;
}
```

6. Declare a **getLastTenCountries** function which which returns the last ten countries in the countries array.
```javascript
function getLastTenCountries(countries){
    // return countries.slice(-10);

    const length = countries.length;
    return countries.filter((_,i) => {
        return i >= length - 10;
    });
    
    /*
    const copyCountries = countries.slice();
    copyCountries.splice(0,copyCountries.length - 10)
    return copyCountries
    */
}
```
