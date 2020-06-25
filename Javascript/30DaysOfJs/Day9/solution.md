## Level 2 Questions

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
***
### Level 3
1. Use the countries information, in the data folder. Sort countries by name, by capital, by population

```javascript
function sortCountriesBy(countries,sortField){
    const copyCountries = countries.slice();
    return sortField === "population" ? 
            copyCountries.sort((a,b) => a.population - b.population) :
            copyCountries.sort((a,b) => a[sortField] < b[sortField])
}
sortCountriesBy(countries,"population"); //sort by population ascending
sortCountriesBy(countries,"name"); //sort by name
```
2. Find the 10 most spoken languages

```javascript
function getAllLanguages(countries){
    return countries.reduce((acc,curr) => {
    acc = acc.concat(curr.languages)
    return acc;
}, []);
}

function parseLanguageAndItCount(languages){
    return languages.reduce((acc,curr) => {
        acc[curr] = getValueOrDefault(acc,curr,0) + 1;
        return acc;
   },{});
}

function mostSpokenLanguages(countries,limit = 10){
    const allLanguages = getAllLanguages(countries);
    const languageStore = parseLanguageAndItCount(allLanguages);
    
    return Object.entries(languageStore)
           .sort((a,b) => b[1] - a[1])
           .slice(0,limit)
           .map(item => `(${item[1]}, ${item[0]})`)
}

```

3. Use countries_data.js file create a function which create the ten most populated countries

```javascript
function sortDataByField(data,field,limit= 5,direction="asc"){
    
    function sortByNumberField(obj1,obj2,field,direction){
        const firstValue = obj1[field];
        const secondValue = obj2[field];
        return direction === "desc" ? secondValue - firstValue
                                     : firstValue - secondValue;
    }

    function sortByStringField(obj1,obj2,field,direction){
        const firstValue = obj1[field];
        const secondValue = obj2[field];
        if(firstValue === secondValue){
            //do nothing. Do not move elements
            return 0;
        }
        //-1 means move element to the left, 1 means move element to the right
        //by default we say if it is lower then move to the left. That means it is ascending order(Lower to higher)
        let result = firstValue < secondValue ? -1 : 1;
        
        if(direction === "desc"){
            result *= -1;
        }
        return result;
    }
    
    const copyData = data.slice();
    const sortFunc = typeof copyData[0][field] === "number" ? sortByNumberField: sortByStringField;
    copyData.sort((a,b) => sortFunc.call(null,a,b,field,direction))     
    return copyData.slice(0,limit).map(c => ({country: c.name, population: c.population}));    
}

sortDataByField(countries,"name",10); //sort countries by their names ascending. 10 items
sortDataByField(countries,"population",25,"desc") //sort countries by their population descending(from higher to lower). 25 items
```
