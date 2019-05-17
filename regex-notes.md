                                                        -----    REGEX ----

Regular expression is a powerful mechanism to find specific patterns in a given context. RE is greedy by default. That means it will try to match pattern as long as possible.
To avoid this greedy behavior we can use question mark(?) to make it lazy. Lazy mean return first match.

let myReg = /\w+/
let name = "chety clooney 777"

In js we write our regular expression between '//'. Somethimes at the end of our regex there are some flags like i and g.
//g -> means do not stop until you finish the sentence. Returns an array.
//i -> means ignore case. Usually regex is case sensitive. che and ChE is not the same thing.But if we use i flag it will be treated same.
^ -> when using outside of [] characters. it means starts with. For example name start with chety ->  name.match(/^chety/)
if it is used within [] characters then it means negate the current process. name does not include numbers -> name.match(/[^0-9]/g)
$ -> Means end with. For example name ends with 777 -> name.match(/777$/)
\w -> Alpha-numeric numbers include _ character. Equivalent to -> [a-zA-Z0-9_]
\W negate of \w. Not alpha-numeric and _ character. Equivalent to -> [^a-zA-Z0-9_]
\d -> Numeric numbers. Equivalent to [0-9]
\D -> Negate of \d. Not numeric values. Equivalent to [^0-9]
\s -> means white space. Also includes  [ \r\t\f\n\v]
\S -> Negate of \s
{} -> Known as quantity specifiers. It is used To match only the letter a appearing between 3 and 5 times in the string "ah", your regex would be /a{3,5}h/. We can omit
lower and upper bounds to specify at least or at most cases.
/a{3,}h/ -> At least three a. "aaah","aaaaaaaaaah" ...
/a{,3}h/ -> Maximum three "a" character. "ah","aah","h" ...etc
/a{3}h/ -> Three times a character. "aaah";
?   -> Make previous character optional.  var reg = /colou?r/  (both color and colour pass this regex.) "?" makes "u" optional.


?= -> Positive look ahead. Cumlenin ön taraflarına bak. bu şartı sağlıyor mu? Genelde bir deger seçmez. sadece verilen kurala uyuyor mu diye kontrol eder. Ozellikle bir 
string üzerinde birden fazla kural kontrolu yapılacaksa bu yontem kullanılır. Mesela şifrelerin valid olup olmama durumunu kontrol gibi.
?! -> Negative look ahead. Bir üsteki belirtilen pozitif look aheadin tersi.

//mesela en az 7 alpha numeric, en az 2 ozel karakter, en az 2 sayi ve x harfi içermeyen şifre regexini aşağıdaki gibi kontrol edebiliriz.
var reg = /(?=\w{7,})(?=.*\W{2,}.*)(?=.*\d{2,}.*)(?!.*x.*)/

?<=  -> Pozitive look behind. Onceki look ahead gibi çalışır. Ama geriye dogru çalışır.
?<!  -> Negative look behind. Pozitive look behind in tersi
