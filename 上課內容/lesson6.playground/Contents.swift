let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella", "Robert"]
let backward = {(s1:String,s2:String) -> Bool in
    return s1 < s2
}
var reversedNames = names.sorted(by: backward)



reversedNames = names.sorted(by: {(s1:String,s2:String) -> Bool in
    return s1 < s2
})



//swift compiler可以推測closure參數和傳出值的資料類型

reversedNames = names.sorted(by: { (s1,s2) in
    return s1 < s2
})



//如果程式區塊只有一行，會自動return
reversedNames = names.sorted(by: { (s1,s2) in s1 < s2})
print(reversedNames)

//使用$0,$1,來代替參數
reversedNames = names.sorted(by: {$0 < $1})
print(reversedNames)

//如果程式區塊是只有比較運算子，就可直接使用
reversedNames = names.sorted(by: < )
print(reversedNames)


let numbers = [56.8, 32.9, 57.0, 54.5, 55.3]
let sortNumbers = numbers.sorted(by: >)
print(sortNumbers)

let scores = [56, 89, 47, 76, 98, 64, 74, 82, 65, 65]

var scores60 = scores.map({(s:Int) -> String in
                            if s >= 60{
                                return "及格"
                            }else{
                                return "不及格"
                            }
})
print(scores60)


