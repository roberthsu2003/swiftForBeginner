import UIKit
func someFunction(firstParameterName:Int, secondParameterName:Int){
    //使用參數名稱
}

someFunction(firstParameterName: 1, secondParameterName: 2)

//指定引數名稱
func greet(person:String,from hometown:String) -> String{
    return "Hello! \(person)! Glad you could visit from \(hometown)"
}

print(greet(person: "Bill", from: "Cupertino"))

func greet(_ person:String,_ hometown:String) -> String{
    return "Hello! \(person)! Glad you could visit from \(hometown)"
}

greet("Bill", "Cupertino")

//有預設值的參數
func someFunction(parameterWithoutDefault:Int = 3, parameterWithDefault:Int = 12){
    
}

someFunction(parameterWithoutDefault: 4)
someFunction(parameterWithoutDefault: 4, parameterWithDefault: 2)
someFunction()

//沒有確定數量的引數
func arithmeticMean(_ numbers:Double...) -> Double{
    var total:Double = 0;
    for number in numbers{
        total += number;
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(1,2,3,4,5,6))
print(arithmeticMean(2,5,6,9,10))

/*
func swapTwoInts(_ a:Int,_ b:Int){
    var a1 = a
    var b1 = b
    let temporary = a1
    a1 = b1
    b1 = temporary
}

var n1 = 666
var n2 = 888

swapTwoInts(n1, n2)
*/

//in-out 參數

func swapTwoInts(_ a: inout Int, _ b:inout Int){
    let temporary = a
    a = b
    b = temporary
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt=\(someInt),anotherInt=\(anotherInt)")

