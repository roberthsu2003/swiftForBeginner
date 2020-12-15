import UIKit

let names = ["Chris", "Alex", "Eva", "Barry", "Daniella"]
print(names.sorted())

let numbers = [4, -6, 9, 25, 98]
print(numbers.sorted())

func backwards(_ s1:String,_ s2:String) -> Bool{
    return s1 > s2;
}

print(names.sorted(by: backwards)) //呼叫使用一般的function

var reversed = names.sorted(by:
    {(s1:String,s2:String) -> Bool in
        return s1 < s2}
)

print(reversed)

//省略return
var reversed1 = names.sorted(by:{(s1:String,s2:String) -> Bool in s1 < s2})

//function的參數和傳出值是它要求的,我們也可以省略
var reversed2 = names.sorted(by:{s1,s2 in s1 < s2})

//參數名稱可以縮寫
var reversed3 = names.sorted(by:{$0 < $1})

//
var reversed4 = names.sorted(by:<)

var reversed5 = names.sorted(by:
    {(s1:String,s2:String) -> Bool in
        return s1 < s2}
)

//將closure寫在最尾部

var reversed6 = names.sorted(){
    (s1:String,s2:String) -> Bool in
        return s1 < s2
    
}

var reversed7 = names.sorted{
    (s1:String,s2:String) -> Bool in
        return s1 < s2
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers1 = [16, 58, 510]

let strings = numbers1.map{ (number:Int) -> String in
    if number == 16 {
        return "61"
    }else if number == 58 {
        return "85"
    }else if number == 510{
        return "015"
    }else{
        return ""
    }
}
print(strings)




