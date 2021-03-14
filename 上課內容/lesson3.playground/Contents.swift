
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
print(shoppingList)

//利用陣列的加法運算，來增加元素
shoppingList += ["Baking Powder"]
shoppingList += ["chocolate Spred", "Cheese", "Butter"]
print(shoppingList)

//取出1個元素
var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"

print(shoppingList)
print(firstItem)

//使用範圍運算子取出多個元素
print(shoppingList[0...2])
print(shoppingList[0..<2])

//使用insert()方法
shoppingList.insert("Maple Syrup", at: 0)
print(shoppingList)

shoppingList.remove(at: 0)
print(shoppingList)

for item in shoppingList{
    print(item)
}
//tuple拆解法
for (index,item) in shoppingList.enumerated(){
    //字串插補
    print("Item \(index): \(item)")
}


