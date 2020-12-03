//運算子

let b = 10
var a = 5
a = b
print(a)

print(1+2)
print(10/3)
print("hello!" + "world")
print(9 % 4)


var a1 = 1
a1 = a1 + 2
print(a1)
//複合指定運算子
a1 = 1
a1 += 2
print(a1)


let name = "world1"
if name == "world" {
    print("相同")
}else{
    print("不相同")
}

/*
var contentHeight = 40
let hasHeader = true
if hasHeader {
    contentHeight += 50
}else{
    contentHeight += 20
}
*/

var contentHeight = 40
let hasHeader = false
contentHeight += (hasHeader ? 50 : 20)
print(contentHeight)

//nil運算子
//??
let defaultColorName = "red"
var userDefinedColorName:String? = "blue"

print(userDefinedColorName ?? defaultColorName)

print(1...5)
print(1..<5)

for index in 1...5 {
    print(index)
}

for index in 1..<5 {
    print(index)
}

