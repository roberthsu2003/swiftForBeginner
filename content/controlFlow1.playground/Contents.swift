let somePoint = (3, 1)
switch somePoint {
    case (0, 0):
        print("x=0,y=0")
    case (_, 0):
        print("y為0")
    case (0, _):
        print("x為0")
    case (-2...2, -2...2):
        print("在範圍內")
    default:
        print("超出範圍")
    
}

let anotherPoint = (0,2)
switch anotherPoint {
    case (let x, 0):
        print("在x軸上,x=\(x)")
    case (0, let y):
        print("在y軸上,y=\(y)")
    case let(x, y):
        print("x=\(x),y=\(y)")
}

//switch where
//第一次比較,第2次比較

let yetAnotherPoint = (-1, -1)
switch yetAnotherPoint {
case let(x, y) where x == y:
    print("x==y")
case let(x,y) where x == -y:
    print("x==-y")
case let(x,y):
    print("x=\(x),y=\(y)")
    
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for character in puzzleInput{
    if charactersToRemove.contains(character){
        continue
    }
    puzzleOutput.append(character)
}

print(puzzleOutput)

let numberSymbol: Character = "三"  // 中文裡的數字 3
var possibleIntegerValue: Int?

switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue{
    print(integerValue)
}else{
    print("nil")
}

func greet(person:[String:String]){
    guard let name = person["name"] else{
        print("沒有值")
        return;
    }
    
    print("Hello! \(name)")
    
    guard let location = person["location"] else{
        print("只有name")
        return
    }
    
    print("name=\(name),location=\(location)")
    
    
}

greet(person: ["name":"abc","location":"taipei"]);




