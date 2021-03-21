print("Hello! World!")

func greet(person:String) -> String{
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))

func operator1(a:Int,b:Int) -> (Int,Int){
    let add = a + b
    let mul = a * b
    return (add, mul)
}

let (add,mul) = operator1(a:10,b:5)
print(add)
print(mul)

//沒有參數的function
func sayHelloWorld() -> String{
    return "Hello, world"
}

//呼叫沒有參數的function
print(sayHelloWorld())

func greetAgain(person:String) -> String{
    return "Hello again," + person + "!"
}

print(greetAgain(person: "robert"))


//多個參數
func greet(person:String, alreadyGreeted:Bool) -> String{
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: false))

//沒有傳出值的function
func greet(person1:String){
    print("Hello,\(person1)")
}

greet(person1: "susan")
/*
func minMax(array:[Int]) -> (min:Int, max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("最小值是\(bounds.min),最大值是\(bounds.max)")
 */

func minMax(array:[Int]) -> (min:Int, max:Int)?{
    if  array.isEmpty {return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value < currentMin{
            currentMin = value
        }else if value > currentMax{
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//我保證bounds一定有值，不是nil
//可以使用fource unwrapping強制打開
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("最小值是\(bounds!.min),最大值是\(bounds!.max)")


//可能會有nil
//使用optional binding,同時檢查，同時force unwrapping
if let bounds = minMax(array: [Int]()){
    print("最小值是\(bounds.min),最大值是\(bounds.max)")
}else{
    print("出錯了，optional type 是nil")
}

