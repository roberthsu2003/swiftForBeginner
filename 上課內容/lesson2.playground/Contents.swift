
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


//nil運算子
let defaultColrName = "red"
var userDefinedColorName:String? = nil   //宣告optional Type沒給值,預設是放nil

var colorNameToUse = userDefinedColorName ?? defaultColrName
print(colorNameToUse)

//範圍運算子
for index in 1...5{
    print(index)
}

for index in 1..<5{
    print(index)
}

//String
//建立空字串
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("空字串")
}

print("anotherEmptyString內的字串數是:\(anotherEmptyString.count)")

//let 不可以修改的字串
//var 可以修改的字串

var variableString = "Horse"
variableString += " and carriage"
print(variableString)

let mString = """
    根據旅遊業者透露，目前規劃的台帛「旅遊泡泡」採團進團出，雙方每週各飛8班，台灣是華航每週6班，長榮每週2班，帛琉太平洋航空則向台灣虎航溼租飛機，每週飛8班。濕租是指航空公司向其他公司租借飛機，連同機組人員一起租。

旅遊業者指出，帛琉受限機場，只能起降100多人座的單走道飛機，旅客量並不大，但總是好的開始，希望未來能有更多的旅遊泡泡。
"""

print(mString)
//建立陣列
var someInts = [Int]() //建立放Int空陣列
print("someInts內的元素數量為\(someInts.count)")
someInts.append(3)
someInts.append(5)
someInts.append(7)
print("someInts內的元素數量為\(someInts.count)")
print(someInts[0])
print(someInts[1])
print(someInts[2])

