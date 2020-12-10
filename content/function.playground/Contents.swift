func greet(person:String) -> String{
    let greeting = "Hello! \(person)!"
    return greeting
}

print(greet(person: "David"))
print(greet(person: "Robert"))

func greetAgain(person:String) -> String{
    return "Hello again, \(person)!"
}

print(greetAgain(person: "Anna"))

//沒有參數
func sayHelloWorld() -> String{
    return "Hello! World"
}

print(sayHelloWorld());

//多個參數
func greet(person:String, alreadyGreeted:Bool) -> String{
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: false))

func greet(person1:String){
    print("greet \(person1)")
}

greet(person1: "Davie")

func minMax(array:[Int]) -> (min:Int,max:Int){
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1...]{
        if value < currentMin{
            currentMin = value;
        }else if value > currentMax{
            currentMax = value;
        }
    }
    
    return(currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])

print("最小值是\(bounds.min),最大值是\(bounds.max)")


func someFunction(firstParameterName:Int, secondParameterName:Int){
    
}

someFunction(firstParameterName: 2, secondParameterName: 5)

func someFunction(argumentLabel parameterName:Int){
    
}

someFunction(argumentLabel: 5)

print("Hello! World")

func someFunction(_ firstParameterName:Int, secondParameterName:Int){
    
}

someFunction(3, secondParameterName: 6)


