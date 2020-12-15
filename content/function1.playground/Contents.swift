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
