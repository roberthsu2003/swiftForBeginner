
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


for (airportCode, airportName) in airports{
    print("\(airportCode):\(airportName)")
}

for airportCode in airports.keys{
    print(airportCode)
}

for airportCode in airports.values{
    print(airportCode)
}

//set

var letters = Set<Character>();
letters.insert("a")
print(letters)
letters.insert("a")
print(letters)

var favoriteGenres:Set = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres)

let oddDigits:Set = [1, 3, 5, 7, 9]
let evenDigits:Set = [0, 2, 4 , 6, 8]

oddDigits.union(evenDigits).sorted()

