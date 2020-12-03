let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("statusCode的值為:\(statusCode)")
print("statusMessage的值為:\(statusMessage)")
/*
let possibleNumber = "123a"
let convertedNumber = Int(possibleNumber)

//使用if來檢查optional的type
if(convertedNumber != nil){
    print("convertedNumber是\(convertedNumber!)")
}else{
    print("轉換成整數出問題了")
}
*/

var serverResponseCode:Int? = 404;
serverResponseCode = nil;

let possibleNumber = "123a"
//optional binding
//if let 常數名稱 = optional變數
//if var 變數名稱 = optional變數
if let convertedNumber = Int(possibleNumber){
    print("convertedNumber是\(convertedNumber)")
}else{
    print("轉換成整數出問題了")
}


