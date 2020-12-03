//集合物件
//Array

var shoppingLish:[String] = ["Eggs", "Milk"]
print(shoppingLish[0])
print(shoppingLish[1])
//print(shoppingLish[2])

//shoppingLish[0] = "MyEggs"
//print(shoppingLish[0])

/*
let shoppingLish:[String] = ["Eggs", "Milk"]
print(shoppingLish[0])
print(shoppingLish[1])
//print(shoppingLish[2])
//不可以改變內容值
//shoppingLish[0] = "MyEggs"
print(shoppingLish[0])
 */

shoppingLish.append("Flour")
print(shoppingLish)

shoppingLish += ["Baking Powder"]
print(shoppingLish)

shoppingLish += ["Chocolate Spread", "Cheese", "Butter"]
print(shoppingLish)

shoppingLish.insert("Maple Syrup", at: 0)
print(shoppingLish)

shoppingLish.remove(at: 0)
print(shoppingLish)

for item in shoppingLish{
    print(item)
}

for index in 0..<shoppingLish.count{
    print(shoppingLish[index])
}

for (index, value) in shoppingLish.enumerated(){
    print("索引編號是\(index),內容是\(value)")
}


