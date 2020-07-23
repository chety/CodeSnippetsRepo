### Level 3
1- Check the speed difference among the following loops: while, for, for of, forEach
```javascript
function measure(){
    const arr = new Array(10 ** 6).fill(1);

    console.time("While");
    let i = 0;
    while(i++ < arr.length){}
    console.timeEnd("While");


    console.time("Regular For");
    for(let i = 0 ; i<arr.length;i++){}
    console.timeEnd("Regular For");

    console.time("For Of");
    for(const val of arr){}
    console.timeEnd("For Of");

    console.time("For In");
    for(const val in arr){}
    console.timeEnd("For In");
}
```
```javascript
measure();
While: 3.14599609375ms
Regular For: 3.532958984375ms
For Of: 37.004150390625ms
For In: 315.581787109375ms
```
