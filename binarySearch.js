function binarySearch(myArray, number ) {
    let minIndex = 0;
    let maxIndex = myArray.length - 1;
    while (minIndex <= maxIndex) {
        const middleIndex = Math.floor((minIndex + maxIndex) / 2);
        const middle = myArray[middleIndex];
        if (middle === number) {
            return middleIndex;
        }
        if (middle < number) {
            minIndex = middleIndex + 1;
        } else {
            maxIndex = middleIndex - 1;
        }
    }
    return -1;
}

function binarySearchRecursive(myArray, left, right, number) {
    if (right >= 0) {
        const middleIndex = Math.floor((left + right) / 2);
        const middle = myArray[middleIndex];
        if (middle === number) {
            return middleIndex;
        }
        if (middle < number) {
            return binarySearchRecursive(
                myArray,
                middleIndex + 1,
                right,
                number
            );
        }
        if (middle > number) {
            return binarySearchRecursive(
                myArray,
                left,
                middleIndex - 1,
                number
            );
        }
    }

    return -1;
}
