function isPalindrome(number) {
    return (
        [].reverse.call(number.toString().split('')).join('') ===
        number.toString()
    );
}

function getNearestPalindrome(number) {
    let nearestBiggerPalindrome = number,
        nearestLesserPalindrome = number;
    let foundLesser = false,
        foundBigger = false;
    while (!foundLesser || !foundBigger) {
        foundLesser = foundLesser || isPalindrome(--nearestLesserPalindrome);
        foundBigger = foundBigger || isPalindrome(++nearestBiggerPalindrome);
    }
    let result = nearestBiggerPalindrome;
    if (
        Math.abs(number - nearestLesserPalindrome) <
        Math.abs(nearestBiggerPalindrome - number)
    ) {
        result = nearestLesserPalindrome;
    }
    return result;
}

function numberOfOpToMakePalindrome(word) {
    let numOfOp = 0;
    for (let i = 0; i < Math.floor(word.length / 2); i++) {
        const firstLetterCode = word.charCodeAt(i);
        const lastLetterCode = word.charCodeAt(word.length - i - 1);
        numOfOp += Math.abs(lastLetterCode - firstLetterCode);
    }
    return numOfOp;
}

function numberOfOperationToMakePalindrome(word, left, right) {
    if (left >= right) {
        return 0;
    }
    const leftCode = word.charCodeAt(left);
    const rightCode = word.charCodeAt(right);
    const diff = Math.abs(rightCode - leftCode);
    return diff + numberOfOperationToMakePalindrome(word, left + 1, right - 1);
}
