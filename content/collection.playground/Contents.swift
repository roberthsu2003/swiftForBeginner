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

//新增元素
airports["LHR"] = "London"
print(airports)

airports["LHR"] = "London Heathrow"
print(airports)

//Dictionary有一個屬性,方法

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUA"){
    print("已經更新,舊的值是\(oldValue)")
    print("全新的airports是\(airports)")
}else{
    print("沒有這個key")
}

airports["APL"] = "Apple International"
print(airports)

airports["APL"] = nil
print(airports)

if let removedValue = airports.removeValue(forKey: "DUB"){
    print("移除成功\(removedValue)")
}else{
    print("移除失敗")
}
