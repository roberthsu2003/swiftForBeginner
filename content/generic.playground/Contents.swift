import UIKit

//傳統的function
func swapTwoInts(_ a:inout Int, _ b:inout Int){
    let temporaryA = a
    a = b
    b = temporaryA
}


func swapTwoStrings(_ a:inout String, _ b:inout String){
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a:inout Double, _ b:inout Double){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt\(someInt), anotherInt\(anotherInt)")

//Generic Function


