var namesOfInters = [Int:String]()
namesOfInters[16] = "sixteen"
print(namesOfInters)

//清空
namesOfInters = [:]

var airports = ["YYZ":"Toronto Pearson",
                                "DUB":"Dublin"]

print(airports.count)
print(airports.isEmpty)

airports["LHR"] = "London"
print(airports)
print(airports["LHR"]!)
print(airports["TAI"] ?? "沒有這個key")

if let airport = airports["LHR"]{
    print(airport)
}else{
    print("沒有這個key")
}

airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("London Heathrow", forKey: "LHR"){
    print("更新成功\(oldValue)")
}else{
    print("更新失敗")
}

for (key,value) in airports{
    print("key:\(key)")
    print("value:\(value)")
    print("=========")
}

