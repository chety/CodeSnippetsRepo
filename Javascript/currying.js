//Currying provides us calling multiple functions after one another (like a pipc mechanism). One function output will be input of next function

function curriedSum2(a) {
    return function (b) {
        return a + b;
    }
}

//this is equivalent of the above function
const curriedSum = a => b => a + b;
