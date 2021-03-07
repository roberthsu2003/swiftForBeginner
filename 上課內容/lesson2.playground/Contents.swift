
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
