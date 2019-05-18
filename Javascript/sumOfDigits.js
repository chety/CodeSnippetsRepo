function sumDigits1(n) {
    let sum = 0;
    while (n > 0) {
        sum += n % 10;
        n = Math.floor(n / 10);
    }
    return sum;
}



function sumDigits2(n) {
    const digits = n.toString().split('').map(Number);
    return digits.reduce((acc, curr) => acc + curr, 0);
}
