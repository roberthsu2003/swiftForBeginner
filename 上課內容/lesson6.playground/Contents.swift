let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella", "Robert"]
let backward = {(s1:String,s2:String) -> Bool in
    return s1 < s2
}
var reversedNames = names.sorted(by: backward)



reversedNames = names.sorted(by: {(s1:String,s2:String) -> Bool in
    return s1 < s2
})

print(reversedNames)
