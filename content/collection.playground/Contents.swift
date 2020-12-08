import UIKit

var someInt = [Int]()
print(someInt.count)
someInt.append(3)
print(someInt)

var thressDouble = Array(repeating: 0, count: 3)
print(thressDouble)

var anotherThreeDoubles = Array(repeating: 100, count: 3)
var sixInts = thressDouble + anotherThreeDoubles
print(sixInts)

// 建立空的Dictionary
//透過型別
var namesOfIntegers = [Int:String]()
print(namesOfIntegers)

//subscript[]語法
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)
namesOfIntegers = [:]
print(namesOfIntegers)


var airports = ["YYZ":"Toronto Peason", "DUB": "Dublin"]
print(airports)
