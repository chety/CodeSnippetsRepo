'use strict';

//In classic recursive we keep all the function call until we reach the base call. It is not call stack friendly
function untilNumberSum(number){
    if(number === 1) return 1;
    return number + untilNumberSum(number - 1);
}

console.log(untilNumberSum(5)); 


//In tail recursive we first make calculation then call the function. We just keep one function call
function untilNumberSumTailRecursive(number){
    function innerSum(num,sum){
        if(num === 0) return sum;
        sum += num;
        num--;
        return innerSum(num,sum);
    }
    return innerSum(number,0);
}

