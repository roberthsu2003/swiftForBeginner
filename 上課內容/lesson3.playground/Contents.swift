
//建立空陣列
var someInt = [Int]()
var someInt1 = Array<Int>()
//求數量
print(someInt.count)
//附加
someInt.append(3)
print(someInt)
someInt.append(5)
print(someInt)
//清空
someInt = []

//建立有預設值的陣列
var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

//相同資料類型的陣列可以相加
var anotherThreeDouble = Array(repeating: 2.5, count: 3)
print(anotherThreeDouble)


var sixDoubles = threeDoubles + anotherThreeDouble
print(sixDoubles)

//一般表示法建立陣列

var shoppingList = ["Eggs", "Milk"]
print(shoppingList.count)

if shoppingList.isEmpty{
    print("是空的")
}else{
    print("不是空的")
}
shoppingList.append("Flour")
shoppingList

