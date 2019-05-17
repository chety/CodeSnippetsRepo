function fibonacciNumberRecursive(number) {
    if (number === 0 || number === 1) {
        return 1;
    }
    return fibonacciNumberRecursive(number - 1) + fibonacciNumberRecursive(number - 2);
}

function fibonacciNumberIterative(number) {
    let a = 1,
        b = 1;
    while (number > 0) {
        [a, b] = [b, a + b]
        number--;
    }
    return a;
}


function fibonacciUntilNumber(number) {
    for (let i = 0; i <= number; i++) {
        console.log(fibonacciNumberIterative(i));
    }
}
