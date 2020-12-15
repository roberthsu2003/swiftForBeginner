import UIKit

let names = ["Chris", "Alex", "Eva", "Barry", "Daniella"]
print(names.sorted())

let numbers = [4, -6, 9, 25, 98]
print(numbers.sorted())

func backwards(_ s1:String,_ s2:String) -> Bool{
    return s1 > s2;
}

print(names.sorted(by: backwards)) //呼叫使用一般的function

var reversed = names.sorted(by: {(s1:String,s2:String) -> Bool in
    return s1 < s2
})

print(reversed)
