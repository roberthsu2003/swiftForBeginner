# 函式
---
- [函式定義與呼叫（Defining and Calling Functions）](#Defining_and_Calling_Functions)
- [函式參數與回傳值（Function Parameters and Return Values）](#Function_Parameters_and_Return_Values)
- [函式參數名稱（Function Parameter Names）](#Function_Parameter_Names)
- [函式型別（Function Types）](#Function_Types)
- [函式嵌套（Nested Functions）](#Nested_Functions)

函式是用來完成特定任務的獨立的程式碼區塊。你給一個函式起一個合適的名字，用來標示函式做什麼，並且當函式需要執行的時候，這個名字會被「呼叫」。

Swift 統一的函式語法足夠靈活，可以用來表示任何函式，包括從最簡單的沒有參數名字的 C 風格函式，到複雜的帶局部和外部參數名的 Objective-C 風格函式。參數可以提供預設值，以簡化函式呼叫。參數也可以既當做傳入參數，也當做傳出參數，也就是說，一旦函式執行結束，傳入的參數值可以被修改。

在 Swift 中，每個函式都有一種型別，包括函式的參數值型別和回傳值型別。你可以把函式型別當做任何其他普通變數型別一樣處理，這樣就可以更簡單地把函式當做別的函式的參數，也可以從其他函式中回傳函式。函式的定義可以寫在在其他函式定義中，這樣可以在嵌套函式範圍內實作功能封裝。

<a name="Defining_and_Calling_Functions"></a>
## 函式的定義與呼叫（Defining and Calling Functions）

當你定義一個函式時，你可以定義一個或多個有名字和型別的值，作為函式的輸入（稱為參數，parameters），也可以定義某種型別的值作為函式執行結束的輸出（稱為回傳型別）。

每個函式有個函式名，用來描述函式執行的任務。要使用一個函式時，你用函式名「呼叫」，並傳給它匹配的輸入值（稱作實參，arguments）。一個函式的實參必須與函式參數表裡參數的順序一致。

在下面範例中的函式叫做`"greetingForPerson"`，之所以叫這個名字是因為這個函式用一個人的名字當做輸入，並回傳給這個人的問候語。為了完成這個任務，你定義一個輸入參數-一個叫做 `personName` 的 `String` 值，和一個包含給這個人問候語的 `String` 型別的回傳值：

```swift
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
```

所有的這些資訊彙總起來成為函式的定義，並以 `func` 作為前綴。指定函式回傳型別時，用回傳箭頭 `->`（一個連字元後跟一個右角括號）後跟回傳型別的名稱的方式來表示。

該定義描述了函式做什麼，它期望接收什麼和執行結束時它回傳的結果是什麼。這樣的定義使的函式可以在別的地方以一種清晰的方式被呼叫：

```swift
print(greet("Anna"))
// prints "Hello, Anna!"
print(greet("Brian"))
// prints "Hello, Brian!
```

呼叫 `greet(person:)` 函式時，在圓括號中傳給它一個 `String` 型別的實參。因為這個函式回傳一個 `String` 型別的值，`greet(person:)` 可以被包含在 `print` 的呼叫中，用來輸出這個函式的回傳值，正如上面所示。

在 `greet(person:)` 的函式體中，先定義了一個新的名為 `greeting` 的 `String` 常數，同時賦值了給 `person` 的一個簡單問候訊息。然後用 `return` 關鍵字把這個問候回傳出去。一旦 `return greeting` 被呼叫，該函式結束它的執行並回傳 `greeting` 的當前值。

你可以用不同的輸入值多次呼叫 `greet(person:)`。上面的範例展示的是用`"Anna"`和`"Brian"`呼叫的結果，該函式分別回傳了不同的結果。

為了簡化這個函式的定義，可以將問候訊息的創建和回傳寫成一句：

```swift
func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
print(greetAgain(person:"Anna"))
// prints "Hello again, Anna!
```

<a name="Function_Parameters_and_Return_Values"></a>
## 函式參數與回傳值（Function Parameters and Return Values）

函式參數與回傳值在Swift中極為靈活。你可以定義任何型別的函式，包括從只帶一個未名參數的簡單函式到複雜的帶有表達性參數名和不同參數選項的複雜函式。

```swift
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
```

### 多重輸入參數（Multiple Input Parameters）

函式可以有多個輸入參數，寫在圓括號中，用逗號分隔。

下面這個函式用一個半開區間的開始點和結束點，計算出這個範圍內包含多少數字：

```swift
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))
// Prints "Hello again, Tim!

```

### 無參數函式（Functions Without Parameters）

函式可以沒有參數。下面這個函式就是一個無參函式，當被呼叫時，它回傳固定的 `String` 訊息：

```swift
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")
// Prints "Hello, Dave!

```

儘管這個函式沒有參數，但是定義中在函式名後還是需要一對圓括號。當被呼叫時，也需要在函式名後寫一對圓括號。

### 無回傳值函式（Functions Without Return Values）

函式可以沒有回傳值。下面是 `sayHello` 函式的另一個版本，叫 `waveGoodbye`，這個函式直接輸出 `String` 值，而不是回傳它：

```swift
func sayGoodbye(personName: String) {
    println("Goodbye, \(personName)!")
}
sayGoodbye("Dave")
// prints "Goodbye, Dave!
```

因為這個函式不需要回傳值，所以這個函式的定義中沒有回傳箭頭（->）和回傳型別。

> 注意：  
> 嚴格上來說，雖然沒有回傳值被定義，`sayGoodbye` 函式依然回傳了值。沒有定義回傳型別的函式會回傳特殊的值，叫 `Void`。它其實是一個空的元組（tuple），沒有任何元素，可以寫成`()`。  

被呼叫時，一個函式的回傳值可以被忽略：

```swift
func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "hello, world")
// prints "hello, world" and returns a value of 12
printWithoutCounting(string: "hello, world")
// prints "hello, world" but does not return a value

```

第一個函式 `printAndCount`，輸出一個字串並回傳 `Int` 型別的字元數。第二個函式 `printWithoutCounting`呼叫了第一個函式，但是忽略了它的回傳值。當第二個函式被呼叫時，訊息依然會由第一個函式輸出，但是回傳值不會被用到。

> 注意：  
> 回傳值可以被忽略，但定義了有回傳值的函式必須回傳一個值，如果在函式定義底部沒有回傳任何值，這叫導致編譯錯誤（compile-time error）。  

### 多重回傳值函式（Functions with Multiple Return Values）

你可以用元組（tuple）型別讓多個值作為一個複合值從函式中回傳。

下面的這個範例中，`count` 函式用來計算一個字串中母音，子音和其他字母的個數（基於美式英語的標準）。

```swift
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


```

```swift
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")
// Prints "min is -6 and max is 109"


```


## optional Tuple Return Type

```swift
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
```

```swift
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}
// Prints "min is -6 and max is 109

```

<a name="Function_Parameter_Names"></a>
## 函式參數名稱和引數名稱（Function Argument Labels and Parameter Names）



```swift
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)

```

### 指定引數名稱

```swift
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

```

```swift
func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}

```

### 省略引數名稱
(_)

```swift
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(1, secondParameterName: 2)

```

### 預設的參數值
```swift
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // If you omit the second argument when calling this function, then
    // the value of parameterWithDefault is 12 inside the function body.
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault is 6
someFunction(parameterWithoutDefault: 4) // parameterWithDefault is 12
```

### 沒有確定數量的引數(variadic Parameters)

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
```

### 可改變的參數內容(In-Out Parameters)
```swift
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

```

```swift
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3

```

<a name="Function_Types"></a>
## 函式型別（Function Types）

每個函式都有種特定的函式型別，由函式的參數型別和回傳型別組成。

例如：

```swift
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}
```

這個範例中定義了兩個簡單的數學函式：`addTwoInts` 和 `multiplyTwoInts`。這兩個函式都傳入兩個 `Int` 型別， 回傳一個合適的`Int`值。

這兩個函式的型別是 `(Int, Int) -> Int`，可以讀作「這個函式型別，它有兩個 `Int` 型的參數並回傳一個 `Int` 型的值。」。

下面是另一個範例，一個沒有參數，也沒有回傳值的函式：

```swift
func printHelloWorld() {
    println("hello, world")
}
```

這個函式的型別是：`() -> Void`，或者叫「沒有參數，並回傳 `Void` 型別的函式。」。沒有指定回傳型別的函式總回傳 `Void`。在Swift中，`Void` 與空的元組是一樣的。

### 使用函式型別（Using Function Types）

在 Swift 中，使用函式型別就像使用其他型別一樣。例如，你可以定義一個型別為函式的常數或變數，並將函式賦值給它：

```swift
var mathFunction: (Int, Int) -> Int = addTwoInts
```

這個可以讀作：

「定義一個叫做 `mathFunction` 的變數，型別是『一個有兩個 `Int` 型的參數並回傳一個 `Int` 型的值的函式』，並讓這個新變數指向 `addTwoInts` 函式」。

`addTwoInts` 和 `mathFunction` 有同樣的型別，所以這個賦值過程在 Swift 型別檢查中是允許的。

現在，你可以用 `mathFunction` 來呼叫被賦值的函式了：

```swift
println("Result: \(mathFunction(2, 3))")
// prints "Result: 5
```

有相同匹配型別的不同函式可以被賦值給同一個變數，就像非函式型別的變數一樣：

```swift
mathFunction = multiplyTwoInts
println("Result: \(mathFunction(2, 3))")
// prints "Result: 6"
```

就像其他型別一樣，當賦值一個函式給常數或變數時，你可以讓 Swift 來推斷其函式型別：

```swift
let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
```

### 函式型別作為參數型別（Function Types as Parameter Types）

你可以用`(Int, Int) -> Int`這樣的函式型別作為另一個函式的參數型別。這樣你可以將函式的一部分實作交由給函式的呼叫者。

下面是另一個範例，正如上面的函式一樣，同樣是輸出某種數學運算結果：

```swift
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// Prints "Result: 8"

```

這個範例定義了 `printMathResult` 函式，它有三個參數：第一個參數叫 `mathFunction`，型別是`(Int, Int) -> Int`，你可以傳入任何這種型別的函式；第二個和第三個參數叫 `a` 和 `b`，它們的型別都是 `Int`，這兩個值作為已給的函式的輸入值。

當 `printMathResult` 被呼叫時，它被傳入 `addTwoInts` 函式和整數`3`和`5`。它用傳入`3`和`5`呼叫 `addTwoInts`，並輸出結果：`8`。

`printMathResult` 函式的作用就是輸出另一個合適型別的數學函式的呼叫結果。它不關心傳入函式是如何實作的，它只關心這個傳入的函式型別是正確的。這使得 `printMathResult` 可以以一種型別安全（type-safe）的方式來保證傳入函式的呼叫是正確的。

### 函式型別作為回傳型別（Function Type as Return Types）

你可以用函式型別作為另一個函式的回傳型別。你需要做的是在回傳箭頭（`->`）後寫一個完整的函式型別。

下面的這個範例中定義了兩個簡單函式，分別是 `stepForward` 和`stepBackward`。`stepForward` 函式回傳一個比輸入值大一的值。`stepBackward` 函式回傳一個比輸入值小一的值。這兩個函式的型別都是 `(Int) -> Int`：

```swift
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
```

下面這個叫做 `chooseStepFunction` 的函式，它的回傳型別是 `(Int) -> Int` 的函式。`chooseStepFunction` 根據布林值 `backwards` 來回傳 `stepForward` 函式或 `stepBackward` 函式：

```swift
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}
```

你現在可以用 `chooseStepFunction` 來獲得一個函式，不管是那個方向：

```swift
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
```

上面這個範例中計算出從 `currentValue` 逐漸接近到`0`是需要向正數走還是向負數走。`currentValue` 的初始值是`3`，這意味著 `currentValue > 0` 是真的（`true`），這將使得 `chooseStepFunction` 回傳 `stepBackward` 函式。一個指向回傳的函式的參考保存在了 `moveNearerToZero` 常數中。

現在，`moveNearerToZero` 指向了正確的函式，它可以被用來數到`0`：

```swift
println("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")
// 3...
// 2...
// 1...
// zero!
```

<a name="Nested_Functions"></a>
## 巢狀函式（Nested Functions）

這章中你所見到的所有函式都叫全域函式（global functions），它們定義在全域域中。你也可以把函式定義在別的函式體中，稱作嵌套函式（nested functions）。

預設情況下，嵌套函式是對外界不可見的，但是可以被他們封閉函式（enclosing function）來呼叫。一個封閉函式也可以回傳它的某一個嵌套函式，使得這個函式可以在其他域中被使用。

你可以用回傳嵌套函式的方式重寫 `chooseStepFunction` 函式：

```swift
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    println("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
println("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!
```
