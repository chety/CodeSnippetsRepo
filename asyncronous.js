//Callback. First version of asyncronous programming in js. 
function printStringWithCallback(word, callback) {
    setTimeout(() => {
        console.log(word);
        callback();
    }, Math.floor(Math.random() * 1000 + 1));
}

function printAllCallback() {
    printStringWithCallback("A", () => {
        printStringWithCallback("B", () => {
            printStringWithCallback("C", () => {});
        });
    });
}

//--------------

//Promise is second version of asyncronous programing in js.
function printStringWithPromise(word) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            console.log(word);
            resolve();
        }, Math.floor(Math.random() * 1000 + 1))

    })
}

function printAllPromise() {
    //If we write like this promise will not quarentee the order of the function call. If we want to work them in order we can write like that
    // printStringWithPromise("A").then(() => printStringWithPromise("B")).then(() => printStringWithPromise("C"))
    printStringWithPromise("A").then(printStringWithPromise("B")).then(printStringWithPromise("C"))
}


//--------------------
//async await is the modern way to make asyncronous call in js. Instad of then in promise call syntax we use "await" keyword inside an "async" function
async function printStringWithAsync() {
    await printStringWithPromise("A");
    await printStringWithPromise("B");
    await printStringWithPromise("C");
}
