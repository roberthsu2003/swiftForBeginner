
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

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber == nil{
    //true 程式區塊
    print("轉換字串成為Int失敗")
}else{
    //false 程式區塊
    print("轉換成功:\(convertedNumber!)")
}


