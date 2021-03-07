
//一般型別
//明確宣告
let age:Int = 50

//不明確告
let age1 = 50

//optional 型別
var age2:Int? = 50

//optional 型別可以放nil
age2 = nil

//implicit optional type
var age3:Int! = 50
age3 = nil

/*
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

 // == 檢查是不是nil
if convertedNumber == nil{
    //true 程式區塊
    print("轉換字串成為Int失敗")
}else{
    //false 程式區塊
    print("轉換成功:\(convertedNumber!)")
}
*/

/*
//optioal binding
let possibleNumber = "123a"
let convertedNumber = Int(possibleNumber)

if let myNumber = convertedNumber{
    print("轉換成功:\(myNumber)")
}else{
    print("轉換\(possibleNumber)成為整數失敗")
}
 */

let possibleNumber = "123"
//optional binding
if let convertedNumber = Int(possibleNumber){
    print("轉換成功:\(convertedNumber)")
}else{
    print("轉換\(possibleNumber)成為整數失敗")
}

let num1:Int? = 15
let num2:Int! = 15

print("num1的值是\(num1!.words)")
print("num2的值是\(num2.words)")

//指定運算子
let b = 10
var a = 5
a = b
print(a)

let (x,y) = (1, 2)

//數學運算子
print(1 + 2)
print(5 - 3)
print(2 * 3)
print(10/3.0)

print("Hello" + "!")
print(9 % 4)


var z = 1
z = z + 1

//複合指定運算子
var s = 1
s += 1
print(s)

//比較運算子
print(1>2)
print(1 >= 1)
print(3 != 5)
print(5 == 5)
/*
let contentHeight = 40
let hasHeader = true
let rowHeight:Int

if hasHeader{
    rowHeight = contentHeight + 50
}else{
    rowHeight = contentHeight + 20
}
 */
let contentHeight = 40
let hasHeader = false
let rowHeight:Int

rowHeight = contentHeight + (hasHeader ? 50 : 20)
print(rowHeight)
