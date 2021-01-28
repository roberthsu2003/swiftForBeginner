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
func swapTwoValues<T>(_ a:inout T,_ b:inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt1 = 3
var anotherInt1 = 107
swapTwoValues(&someInt1, &anotherInt1)
print("someInt1=\(someInt1), anotherInt1=\(anotherInt1)")

var someDouble = 3.0
var anotherDouble = 107.0
swapTwoValues(&someDouble, &anotherDouble)
print("someDouble=\(someDouble), anotherDouble=\(anotherDouble)")

//傳統 Type
struct IntStack{
    var items = [Int]()
    mutating func push(_ item:Int){
        items.append(item)
    }
    
    mutating func pop() -> Int{
        return items.removeLast()
    }
}

struct Stack<Element>{
    var items = [Element]()
    mutating func push(_ item:Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

let fromTheTop = stackOfStrings.pop()
print("fromTheTop=\(fromTheTop)")

func findIndex(ofString valueToFind:String, in array:[String]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]

if let foundIndex = findIndex(ofString: "dog", in: strings){
    print("foundIndex=\(foundIndex)")
}

func findIndex<T:Equatable>(ofString valueToFind:T, in array:[T]) -> Int?{
    for (index, value) in array.enumerated(){
        if value == valueToFind{
            return index
        }
    }
    return nil
}



